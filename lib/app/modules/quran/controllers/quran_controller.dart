import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:muslim_app/API/api.dart';
import 'package:muslim_app/app/models/ayat.dart';
import 'package:muslim_app/app/models/surah.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:muslim_app/app/models/audiometa.dart';
import 'package:muslim_app/app/models/audioposition.dart';
import 'package:rxdart/rxdart.dart' as r;

class QuranController extends GetxController {
  final player = AudioPlayer();

  Stream<AudioPositionData> get positionDataStream =>
      r.Rx.combineLatest3<Duration, Duration, Duration?, AudioPositionData>(
          player.positionStream,
          player.bufferedPositionStream,
          player.durationStream,
          (position, bufferedPosition, duration) => AudioPositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  Future<List<Surah>> getIndexSurah() async {
    var result = await http.get(Uri.parse(urlSurah));
    if (result.statusCode == 200) {
      List<dynamic> data = await json.decode(result.body);
      List<Surah> listOfSurah = data.map((e) => Surah.fromJson(e)).toList();
      return listOfSurah;
    } else {
      return <Surah>[];
    }
  }

  Future<Ayat> getAyat(int index) async {
    var result = await http.get(Uri.parse("$urlSurah/$index"));
    if (result.statusCode == 200) {
      var resultBody = json.decode(result.body);
      Ayat ayat = Ayat.fromJson(resultBody);
      return ayat;
    } else {
      throw Exception;
    }
  }

  Future<List<AudioSource>> playlist(Surah surah) async {
    List<AudioSource> listOfAudioSource = [];
    String numberOfSurah = surah.nomor.toString().padLeft(3, '0');
    for (int i = 0; i < surah.jumlahAyat + 1; i++) {
      String numberOfAyat = i.toString().padLeft(3, '0');
      listOfAudioSource.add(AudioSource.uri(
          tag: AudioMetadata(
            album: surah.namaLatin,
            title: surah.arti,
          ),
          Uri.parse(
            "$ayatAudio/$numberOfSurah$numberOfAyat.mp3",
          )));
    }
    return listOfAudioSource;
  }

  Future<void> init(Surah surah) async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    player.playbackEventStream
        .listen((event) {}, onError: (Object e, StackTrace stackTrace) {});
    try {
      await player.setAudioSource(
          ConcatenatingAudioSource(
              useLazyPreparation: true,
              shuffleOrder: DefaultShuffleOrder(),
              children: await playlist(surah)),
          preload: kIsWeb || defaultTargetPlatform != TargetPlatform.linux);
    } catch (e) {
      Get.snackbar('Error', '$e');
    }
  }

  @override
  InternalFinalCallback<void> get onDelete {
    player.stop();
    return super.onDelete;
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
