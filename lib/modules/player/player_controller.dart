import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/player/screens/widgets/image_slider.dart';
import 'package:sound_rhythm/modules/utils/format_utils.dart';
import 'package:sound_rhythm/modules/utils/responsive.dart';

class PlayerController {
  AudioPlayer audioPlayer = AudioPlayer();
  VoidCallback callback = () {};
  bool isSongPlaying = false;
  bool isSongLooping = false;
  double playbackSpeed = 1.0;
  Duration songPosition = const Duration();
  Duration songDuration = const Duration();
  String songTitle = "";

  PlayerController(
      {required AudioPlayer audioPlayer, required VoidCallback callback}) {
    this.audioPlayer = audioPlayer;
    print("222222222222");

    updateSong(0);
    audioPlayer.setReleaseMode(ReleaseMode.stop);
    audioPlayer.onPlayerComplete.listen((event) {
      isSongPlaying = false;
      callback();
    });
    audioPlayer.onPositionChanged.listen((event) {
      songPosition = event;
      callback();
    });
  }

  Future<void> playSong() async {
    await audioPlayer.setVolume(1.0);
    await audioPlayer.resume();

    isSongPlaying = true;
    callback();
  }

  Future<void> pauseSong() async {
    await audioPlayer.pause();

    isSongPlaying = false;
    callback();
  }

  Future<void> stopAudioPlayer() async {
    await audioPlayer.stop();

    isSongPlaying = false;
    callback();
  }

  Future<void> toggleLoop() async {
    if (isSongLooping) {
      await audioPlayer.setReleaseMode(ReleaseMode.stop);
    } else {
      await audioPlayer.setReleaseMode(ReleaseMode.loop);
    }

    isSongLooping = !isSongLooping;
    callback();
  }

  Future<void> seekInSong(double newValue) async {
    await audioPlayer.seek(Duration(seconds: newValue.toInt()));
  }

  void updateTitle(title) async {
    songTitle = title;
    callback();
  }

  void setPlaybackRate(double speed) async {
    playbackSpeed = speed;
    audioPlayer.setPlaybackRate(playbackSpeed);
  }

  songChangedCallback(int index, reason) {
    updateSong(index);
  }

  Future<void> updateSong(int index) async {
    stopAudioPlayer();
    await audioPlayer.release();

    print("index is: $index");
    switch (index) {
      case 0:
        // await audioPlayer.setSource(AssetSource('sounds/Vocalizacion0.wav'));
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion0.wav'));
        updateTitle("Wonderful");
        break;
      case 1:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion1.wav'));
        updateTitle("Halo");
        break;
      case 2:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion2.wav'));
        updateTitle("Lead the way");
        break;
      case 3:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion3.mp3'));
        updateTitle("Fallin");
        break;
      case 4:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion4.mp3'));
        updateTitle("Woman's");
        break;
      case 5:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion5.mp3'));
        updateTitle("Déjà vu");
        break;
      case 6:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion6.mp3'));
        updateTitle("Respect");
        break;
      case 7:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion7.mp3'));
        updateTitle("Vision");
        break;
      case 8:
        await audioPlayer.setSource(AssetSource('sounds/Vocalizacion8.mid'));
        updateTitle("Wonderful Midi");
        break;
      default:
        await audioPlayer.setSource(AssetSource('sounds/coin.wav'));
        break;
    }
    songDuration = await audioPlayer.getDuration() ?? const Duration();
  }
}
