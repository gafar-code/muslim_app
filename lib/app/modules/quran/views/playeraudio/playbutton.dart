import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';

class PlayButton extends StatelessWidget {
  final AudioPlayer player;

  const PlayButton(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: StreamBuilder<PlayerState>(
        stream: player.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          final processingState = playerState?.processingState;
          final playing = playerState?.playing;
          if (processingState == ProcessingState.loading ||
              processingState == ProcessingState.buffering) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              width: 40,
              height: 40,
              child: const CircularProgressIndicator(),
            );
          } else if (playing != true) {
            return GestureDetector(
              onTap: player.play,
              child: Center(child: SvgPicture.asset('assets/icons/play.svg')),
            );
          } else if (processingState != ProcessingState.completed) {
            return GestureDetector(
              onTap: player.pause,
              child: Center(
                  child: SvgPicture.asset('assets/icons/play_pause.svg')),
            );
          } else {
            return IconButton(
              icon: const Icon(Icons.replay),
              iconSize: 40.0,
              onPressed: () => player.seek(Duration.zero,
                  index: player.effectiveIndices!.first),
            );
          }
        },
      ),
    );
  }
}
