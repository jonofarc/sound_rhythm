import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/player/screens/player_view_desktop.dart';
import 'package:sound_rhythm/modules/player/screens/player_view_mobile.dart';
import 'package:sound_rhythm/modules/utils/responsive.dart';

class PlayerScreen extends StatelessWidget {
  PlayerScreen({super.key, required this.title});

  final String title;

  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    Widget layout = Container();

    if (Responsive.isMobile(context)) {
      layout = PlayerViewMobile(title: title);
    } else {
      layout = PlayerViewDesktop(
        title: title,
        audioPlayer: audioPlayer,
      );
    }
    return layout;
  }
}
