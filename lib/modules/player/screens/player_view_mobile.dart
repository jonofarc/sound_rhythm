import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/player/player_controller.dart';
import 'package:sound_rhythm/modules/player/screens/widgets/image_slider.dart';
import 'package:sound_rhythm/modules/utils/format_utils.dart';
import 'package:sound_rhythm/modules/utils/image_slider_utils.dart';

class PlayerViewMobile extends StatefulWidget {
  const PlayerViewMobile({
    super.key,
    required this.playerController,
  });

  final PlayerController playerController;

  @override
  State<PlayerViewMobile> createState() => _PlayerViewMobileState();
}

class _PlayerViewMobileState extends State<PlayerViewMobile> {
  @override
  void initState() {
    super.initState();
  }

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
          songChangedCallback: widget.playerController.songChangedCallback,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.playerController.songTitle,
                style: const TextStyle(fontSize: 20),
              ),
              Slider(
                value:
                    widget.playerController.songPosition.inSeconds.toDouble(),
                onChanged: (newValue) {
                  widget.playerController.seekInSong(newValue);
                },
                min: 0,
                max: widget.playerController.songDuration.inSeconds.toDouble(),
                label: FormatUtils.formatDuration(
                    widget.playerController.songPosition),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FormatUtils.formatDuration(
                            widget.playerController.songPosition),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        FormatUtils.formatDuration(
                            widget.playerController.songDuration),
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
                icon: widget.playerController.isSongPlaying
                    ? const Icon(Icons.pause_circle_outline)
                    : const Icon(Icons.play_circle_outlined),
                iconSize: 48,
                onPressed: () {
                  if (widget.playerController.isSongPlaying) {
                    widget.playerController.pauseSong();
                  } else {
                    widget.playerController.playSong();
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.stop_circle_outlined),
                iconSize: 48,
                onPressed: () {
                  widget.playerController.stopAudioPlayer();
                },
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: widget.playerController.isSongLooping
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
                    widget.playerController.toggleLoop();
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
                'Play back rate: ${widget.playerController.playbackSpeed.toStringAsFixed(1)}',
                style: const TextStyle(fontSize: 20),
              ),
              Slider(
                value: widget.playerController.playbackSpeed,
                onChanged: (newValue) {
                  setState(() {
                    widget.playerController.playbackSpeed = newValue;
                    widget.playerController.audioPlayer
                        .setPlaybackRate(widget.playerController.playbackSpeed);
                  });
                },
                min: 0.5,
                max: 2,
                divisions: 15,
                label: widget.playerController.playbackSpeed.toStringAsFixed(2),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
