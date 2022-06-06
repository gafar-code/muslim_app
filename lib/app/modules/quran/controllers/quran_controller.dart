import 'dart:collection';
import 'dart:convert';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:muslim_app/API/api.dart';
import 'package:muslim_app/models/surah.dart';

class QuranController extends GetxController {
  PlayerController playerController = PlayerController();
  playerPrepare(String path) async {
    await playerController.preparePlayer(path);
  }

  playerStart() async {
    await playerPrepare('assets/test.mp3');
    playerController.startPlayer();
  }

  playerPause() {
    playerController.pausePlayer();
  }

  playerStop() {
    playerController.stopPlayer();
  }

  Future<List<Surah>> getSurah() async {
    var result = await http.get(Uri.parse(urlSurah));
    if (result.statusCode == 200) {
      Map<String, dynamic> map = await json.decode(result.body);
      List<Surah> listOfSurah = [];
      for (int i = 0; i < 114; i++) {
        listOfSurah.add(Surah.fromJson(HashMap.from(map['data'][i])));
      }
      return listOfSurah;
    } else {
      return <Surah>[];
    }
  }
}
