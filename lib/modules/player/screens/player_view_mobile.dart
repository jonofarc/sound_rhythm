import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/player/player_controller.dart';
import 'package:sound_rhythm/modules/player/screens/widgets/image_slider.dart';
import 'package:sound_rhythm/modules/utils/format_utils.dart';
import 'package:sound_rhythm/modules/utils/image_slider_utils.dart';

class PlayerViewMobile extends StatelessWidget {
  const PlayerViewMobile({
    Key? key,
    required this.playerController,
  }) : super(key: key);

  final PlayerController playerController;

  @override
  Widget build(BuildContext context) {
    List<Widget> imageSliders = ImageSliderUtils.getCovers();

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
                iconSize: 48,
                onPressed: () {
                  playerController.stopAudioPlayer();
                },
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: playerController.isSongLooping
                      ? Colors.grey
                      : Colors.transparent,
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 2.0, // Border width
                  ),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.loop),
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
                  playerController.audioPlayer
                      .setPlaybackRate(playerController.playbackSpeed);
                },
                min: 0.5,
                max: 2,
                divisions: 15,
                label: playerController.playbackSpeed.toStringAsFixed(2),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
