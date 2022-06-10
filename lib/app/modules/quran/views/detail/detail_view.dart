// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:muslim_app/app/modules/quran/controllers/quran_controller.dart';
import 'package:muslim_app/app/modules/quran/views/playeraudio/playeraudio.dart';
import 'package:muslim_app/app/models/ayat.dart';
import 'package:muslim_app/app/models/surah.dart';
import 'package:muslim_app/theme.dart';

import 'ayatwidget.dart';
import 'header.dart';

class DetailView extends GetView<QuranController> {
  @override
  Widget build(BuildContext context) {
    Get.find<QuranController>();
    final Surah surah = Get.arguments;
    return Scaffold(
        backgroundColor: greyColor,
        body: Column(
          children: [
            HeaderWidget(surah.namaLatin),
            Expanded(
              child: StreamBuilder<SequenceState?>(
                stream: controller.player.sequenceStateStream,
                builder: (context, snapshot) {
                  final state = snapshot.data;
                  final sequence = state?.sequence ?? [];
                  return FutureBuilder<Ayat>(
                      future: controller.getAyat(surah.nomor),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          Ayat data = snapshot.data!;
                          return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.fromLTRB(0, 12, 0, 80),
                              itemCount: data.ayat.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    controller.player
                                        .seek(Duration.zero, index: index);
                                  },
                                  child: AyatWidget(data.ayat[index],
                                      (index == state!.currentIndex - 1)),
                                );
                              });
                        }
                        return Center(child: CircularProgressIndicator());
                      }));
                },
              ),
            ),
            PlayerAudio(surah)
          ],
        ));
  }
}
