import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/player/player_controller.dart';
import 'package:sound_rhythm/modules/player/screens/player_view_desktop.dart';
import 'package:sound_rhythm/modules/player/screens/player_view_mobile.dart';
import 'package:sound_rhythm/modules/utils/image_slider_utils.dart';
import 'package:sound_rhythm/modules/utils/responsive.dart';
import 'package:sound_rhythm/modules/utils/widget_utils.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  PlayerScreenState createState() => PlayerScreenState();
}

class PlayerScreenState extends State<PlayerScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();

  late VoidCallback callback;

  late PlayerController playerController;
  List<Widget> imageSliders = ImageSliderUtils.getCovers();

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
        imageSliders: imageSliders,
      );
    } else {
      layout = PlayerViewDesktop(
        playerController: playerController,
        imageSliders: imageSliders,
      );
    }
    return Scaffold(
        appBar: WidgetUtils().getLogOutAppbar(context), body: layout);
  }

  @override
  void dispose() {
    audioPlayer
        .dispose(); // Dispose of the audio player when the screen is disposed
    super.dispose();
  }
}
