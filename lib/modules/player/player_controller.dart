import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/utils/log.dart';
import 'package:sound_rhythm/modules/utils/song_utils.dart';

class PlayerController {
  AudioPlayer audioPlayer;
  VoidCallback callback;
  bool isSongPlaying = false;
  bool isSongLooping = false;
  double playbackSpeed = 1.0;
  Duration songPosition = const Duration();
  Duration songDuration = const Duration();
  String songTitle = "";
  RangeValues loopRangeValues = const RangeValues(0, 0);

  PlayerController({required this.audioPlayer, required this.callback}) {
    updateSong(0);
    audioPlayer.setReleaseMode(ReleaseMode.stop);
    audioPlayer.onPlayerComplete.listen((event) {
      isSongPlaying = false;
      callback();
    });
    audioPlayer.onPositionChanged.listen((event) async {
      songPosition = event;

      //check if we are in loop range otherwise set minimum loop range
      if (songPosition.inSeconds.toDouble() < loopRangeValues.start - 1 ||
          songPosition.inSeconds.toDouble() > loopRangeValues.end) {
        await seekInSong(loopRangeValues.start);
      }

      callback();
    });
  }

  Future<void> setLoopRangeValues(RangeValues values) async {
    loopRangeValues = values;
    Log.debug("New ran1ges: $values");
    Log.debug("loopedRangeValues: $loopRangeValues");

    callback();
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
    songPosition = Duration.zero;

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
    await playSong();
    audioPlayer.setPlaybackRate(playbackSpeed);

    callback();
  }

  songChangedCallback(int index, reason) {
    updateSong(index);
  }

  Future<void> updateSong(int index) async {
    await stopAudioPlayer();
    await audioPlayer.release();

    await audioPlayer.setSource(SongUtils.songs[index].source);
    updateTitle(SongUtils.songs[index].name);

    songDuration = await audioPlayer.getDuration() ?? const Duration();
    loopRangeValues = RangeValues(0, songDuration.inSeconds.toDouble());
  }
}
