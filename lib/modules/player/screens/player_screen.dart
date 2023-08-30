import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/player/screens/widgets/image_slider.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key, required this.title});

  final String title;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isSongPlaying = false;
  bool isSongLooping = false;
  double playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    updateSong(0);
    audioPlayer.setReleaseMode(ReleaseMode.stop);
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isSongPlaying = false;
      });
    });
  }

  Future<void> playSong() async {
    await audioPlayer.setVolume(1.0);
    await audioPlayer.resume();
    setState(() {
      isSongPlaying = true;
    });
  }

  Future<void> pauseSong() async {
    await audioPlayer.pause();
    setState(() {
      isSongPlaying = false;
    });
  }

  Future<void> stopAudioPlayer() async {
    await audioPlayer.stop();
    setState(() {
      isSongPlaying = false;
    });
  }

  Future<void> toggleLoop() async {
    if (isSongLooping) {
      await audioPlayer.setReleaseMode(ReleaseMode.stop);
    } else {
      await audioPlayer.setReleaseMode(ReleaseMode.loop);
    }

    setState(() {
      isSongLooping = !isSongLooping;
    });
  }

  songChangedCallback(int index, reason) {
    updateSong(index);
  }

  Future<void> updateSong(int index) async {
    stopAudioPlayer();
    await audioPlayer.release();

    switch (index) {
      case 0:
        // await audioPlayer.setSource(AssetSource('sounds/Vocalizacion0.wav'));
        await audioPlayer.setSource(AssetSource('sounds/coin.wav'));
      case 1:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion1.wav'));
      case 2:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion2.wav'));
      case 3:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion3.mp3'));
      case 4:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion4.mp3'));
      case 5:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion5.mp3'));
      case 6:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion6.mp3'));
      case 7:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion7.mp3'));
      case 8:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion8.mid'));
      default:
        await audioPlayer.setSource(AssetSource('sounds/coin.wav'));
    }
  }

  @override
  Widget build(BuildContext context) {
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

    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ImageSlider(
          imageSliders: imageSliders,
          songChangedCallback: songChangedCallback,
        ),
        SizedBox(
          height: 100,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: isSongPlaying
                    ? const Icon(Icons.pause_circle_outline)
                    : const Icon(Icons.play_circle_outlined),
                iconSize: 48,
                onPressed: () {
                  if (isSongPlaying) {
                    pauseSong();
                  } else {
                    playSong();
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.stop_circle_outlined),
                iconSize: 48,
                onPressed: () {
                  stopAudioPlayer();
                },
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isSongLooping ? Colors.grey : Colors.transparent,
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
                    toggleLoop();
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
                'Speed: ${playbackSpeed.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20),
              ),
              Slider(
                value: playbackSpeed,
                onChanged: (newValue) {
                  setState(() {
                    playbackSpeed = newValue;
                    audioPlayer.setPlaybackRate(playbackSpeed);
                  });
                },
                min: 0.5,
                max: 2,
                divisions: 15,
                label: playbackSpeed.toStringAsFixed(2),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
