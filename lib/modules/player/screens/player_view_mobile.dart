import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/player/player_controller.dart';
import 'package:sound_rhythm/modules/player/screens/widgets/image_slider.dart';
import 'package:sound_rhythm/modules/utils/format_utils.dart';

class PlayerViewMobile extends StatelessWidget {
  const PlayerViewMobile({
    Key? key,
    required this.playerController,
    required this.imageSliders,
  }) : super(key: key);

  final PlayerController playerController;
  final List<Widget> imageSliders;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 16,
        ),
        ImageSlider(
          imageSliders: imageSliders,
          songChangedCallback: playerController.songChangedCallback,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                playerController.songTitle,
                style: const TextStyle(fontSize: 20),
              ),
              Slider(
                value: playerController.songPosition.inSeconds.toDouble(),
                onChanged: (newValue) {
                  playerController.seekInSong(newValue);
                },
                min: 0,
                max: playerController.songDuration.inSeconds.toDouble(),
                label:
                    FormatUtils.formatDuration(playerController.songPosition),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FormatUtils.formatDuration(
                            playerController.songPosition),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        FormatUtils.formatDuration(
                            playerController.songDuration),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ]),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: playerController.isSongPlaying
                    ? const Icon(Icons.pause_circle_outline)
                    : const Icon(Icons.play_circle_outlined),
                iconSize: 48,
                color: Colors.black,
                onPressed: () {
                  if (playerController.isSongPlaying) {
                    playerController.pauseSong();
                  } else {
                    playerController.playSong();
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.stop_circle_outlined),
                color: Colors.black,
                iconSize: 48,
                onPressed: () {
                  playerController.stopAudioPlayer();
                },
              ),
              const SizedBox(width: 7.0),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: playerController.isSongLooping
                      ? Colors.black
                      : Colors.transparent,
                  border: Border.all(
                    width: 3.0, // Border width
                  ),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.loop),
                  color: playerController.isSongLooping
                      ? Colors.white
                      : Colors.black,
                  iconSize: 20,
                  onPressed: () {
                    playerController.toggleLoop();
                  },
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Play back rate: ${playerController.playbackSpeed.toStringAsFixed(1)}',
                style: const TextStyle(fontSize: 20),
              ),
              Slider(
                value: playerController.playbackSpeed,
                onChanged: (newValue) {
                  playerController.setPlaybackRate(newValue);
                },
                min: 0.5,
                max: 2,
                divisions: 15,
                label: playerController.playbackSpeed.toStringAsFixed(2),
              ),
            ],
          ),
        ),
        const Text(
          'Loop Range',
          style: TextStyle(fontSize: 20),
        ),
        RangeSlider(
          values: playerController.loopRangeValues,
          max: playerController.songDuration.inSeconds.toDouble(),
          labels: RangeLabels(
            playerController.loopRangeValues.start.round().toString(),
            playerController.loopRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            playerController.setLoopRangeValues(values);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              FormatUtils.formatNum(playerController.loopRangeValues.start),
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              FormatUtils.formatNum(playerController.loopRangeValues.end),
              style: const TextStyle(fontSize: 20),
            ),
          ]),
        ),
      ],
    ));
  }
}
