import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/player/player_controller.dart';
import 'package:sound_rhythm/modules/player/screens/player_view_desktop.dart';
import 'package:sound_rhythm/modules/player/screens/player_view_mobile.dart';
import 'package:sound_rhythm/modules/utils/responsive.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();

  late VoidCallback callback;

  late PlayerController playerController;

  @override
  void initState() {
    super.initState();

    callback = () {
      setState(() {});
    };

    playerController =
        PlayerController(audioPlayer: audioPlayer, callback: callback);
  }

  @override
  Widget build(BuildContext context) {
    Widget layout = Container();

    if (Responsive.isMobile(context)) {
      layout = PlayerViewMobile(
        playerController: playerController,
      );
    } else {
      layout = PlayerViewDesktop(
        playerController: playerController,
      );
    }
    return layout;
  }

  @override
  void dispose() {
    audioPlayer
        .dispose(); // Dispose of the audio player when the screen is disposed
    super.dispose();
  }
}
