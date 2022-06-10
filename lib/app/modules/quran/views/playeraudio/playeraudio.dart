import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/models/audioposition.dart';
import 'package:muslim_app/app/models/surah.dart';
import 'package:muslim_app/app/modules/quran/controllers/quran_controller.dart';
import 'package:muslim_app/theme.dart';

import 'controllbutton.dart';
import 'seekbar.dart';

class PlayerAudio extends GetView<QuranController> {
  final Surah surah;
  PlayerAudio(this.surah);
  @override
  Widget build(BuildContext context) {
    Get.find<QuranController>();
    controller.init(surah);
    return Container(
        height: 140.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [],
          color: whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            ControlButtons(controller.player),
            StreamBuilder<AudioPositionData>(
              stream: controller.positionDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return SeekBar(
                  duration: positionData?.duration ?? Duration.zero,
                  position: positionData?.audioPosition ?? Duration.zero,
                  bufferedPosition:
                      positionData?.bufferedAudioPosition ?? Duration.zero,
                  onChangeEnd: (newPosition) {
                    controller.player.seek(newPosition);
                  },
                );
              },
            ),
          ],
        ));
  }
}
