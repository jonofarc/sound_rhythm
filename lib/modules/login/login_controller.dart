import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/player/models/song.dart';
import 'package:sound_rhythm/modules/player/screens/player_screen.dart';
import 'package:sound_rhythm/modules/utils/app_utils.dart';
import 'package:sound_rhythm/modules/utils/constants.dart';
import 'package:sound_rhythm/modules/utils/song_utils.dart';

class LoginController {
  LoginController();

  bool userLoggedIn = false;

  bool loginSubmit(
      {required String userName,
      required String password,
      required BuildContext context}) {
    FocusScope.of(context).unfocus();
    if (userName == defaultUsername && password == defaultPassword) {
      final appUtils = AppUtils();
      appUtils.storeCredentials(userName: userName, password: password);
      _loginSuccess(context: context);
      userLoggedIn = true;
      return true;
    } else {
      userLoggedIn = false;
      return false;
    }
  }

  _loginSuccess({required BuildContext context}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const PlayerScreen();
          },
        ),
      );
    });
  }
}
