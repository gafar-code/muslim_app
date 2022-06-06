import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:get/get.dart';

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

  @override
  onInit() {
    super.onInit();
  }
}
