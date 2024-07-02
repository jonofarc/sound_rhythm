import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/login/login_controller.dart';
import 'package:sound_rhythm/modules/login/screens/login_view_mobile.dart';
import 'package:sound_rhythm/modules/player/player_controller.dart';
import 'package:sound_rhythm/modules/player/screens/player_view_desktop.dart';
import 'package:sound_rhythm/modules/player/screens/player_view_mobile.dart';
import 'package:sound_rhythm/modules/utils/image_slider_utils.dart';
import 'package:sound_rhythm/modules/utils/responsive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();

  late VoidCallback callback;

  late LoginController loginController;
  List<Widget> imageSliders = ImageSliderUtils.getCovers();

  @override
  void initState() {
    super.initState();

    callback = () {
      setState(() {});
    };

    loginController = LoginController();
  }

  @override
  Widget build(BuildContext context) {
    Widget layout = Container();

    if (Responsive.isMobile(context)) {
      layout = LoginViewMobile(
        loginController: loginController,
      );
    } else {
      layout = LoginViewMobile(
        loginController: loginController,
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
