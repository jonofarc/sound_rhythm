import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/player/player_controller.dart';
import 'package:sound_rhythm/modules/player/screens/widgets/image_slider.dart';
import 'package:sound_rhythm/modules/utils/format_utils.dart';
import 'package:sound_rhythm/modules/utils/responsive.dart';

class PlayerViewDesktop extends StatefulWidget {
  const PlayerViewDesktop(
      {super.key, required this.title, required this.audioPlayer});

  final String title;
  final AudioPlayer audioPlayer;

  @override
  State<PlayerViewDesktop> createState() => _PlayerViewDesktopState();
}

class _PlayerViewDesktopState extends State<PlayerViewDesktop> {
  late VoidCallback callback;

  late PlayerController playerController;

  @override
  void initState() {
    super.initState();

    callback = () {
      setState(() {});
    };

    playerController =
        PlayerController(audioPlayer: widget.audioPlayer, callback: callback);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leftPanel(),
        const VerticalDivider(
          color: Colors.black,
          thickness: 2,
        ),
        rightPanel(),
      ],
    );
  }

  Widget leftPanel() {
    List<Widget> imageSliders = [];
    for (int i = 0; i <= 8; i++) {
      imageSliders.add(
        Image.asset(
          'assets/img/notes$i.png', // Path to your asset image
          width: 300,
          height: 300,
        ),
      );
    }

    return Expanded(
      flex: 1,
      child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
            ImageSlider(
              imageSliders: imageSliders,
              songChangedCallback: playerController.songChangedCallback,
            ),
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
              label: FormatUtils.formatDuration(playerController.songPosition),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FormatUtils.formatDuration(playerController.songPosition),
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      FormatUtils.formatDuration(playerController.songDuration),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ]),
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
          ])),
    );
  }

  Widget rightPanel() {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.only(top: 16),
        // Color of the second widget
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Play back rate: ${playerController.playbackSpeed.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 20),
            ),
            Slider(
              value: playerController.playbackSpeed,
              onChanged: (newValue) {
                setState(() {
                  playerController.setPlaybackRate(newValue);
                });
              },
              min: 0.5,
              max: 2,
              divisions: 15,
              label: playerController.playbackSpeed.toStringAsFixed(2),
            ),
          ],
        ),
      ),
    );
  }
}
