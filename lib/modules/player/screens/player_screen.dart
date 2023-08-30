import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key, required this.title});

  final String title;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  List<AudioPlayer> audioPlayers = [AudioPlayer(), AudioPlayer()];

  @override
  void initState() {
    super.initState();
    setSounds();
  }

  Future<void> playSound(AudioPlayer audioPlayer) async {
    await audioPlayer.setVolume(1.0);
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    audioPlayer.resume();
  }

  Future<void> setSounds() async {
    await audioPlayers[0].setSource(AssetSource('sounds/coin.wav'));
    await audioPlayers[1].setSource(AssetSource('sounds/bonus.wav'));
  }

  Future<void> stopAllAudioPlayers() async {
    for (var audioPlayer in audioPlayers) {
      audioPlayer.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            playSound(audioPlayers[0]);
          },
          child: const Text('coin'),
        ),
        ElevatedButton(
          onPressed: () {
            playSound(audioPlayers[1]);
          },
          child: const Text('bonus'),
        ),
        ElevatedButton(
          onPressed: () {
            stopAllAudioPlayers();
          },
          child: const Text('Stop All'),
        ),
      ],
    );
  }
}
