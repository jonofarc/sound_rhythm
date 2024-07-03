import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/login/credentials_validation.dart';
import 'package:sound_rhythm/modules/login/login_controller.dart';
import 'package:sound_rhythm/modules/player/screens/player_screen.dart';
import 'package:sound_rhythm/modules/utils/constants.dart';
import 'package:sound_rhythm/modules/utils/log.dart';
import 'package:sound_rhythm/shared/shared_preferences/local_storage.dart';
import 'package:sound_rhythm/shared/shared_preferences/local_storage_key.dart';

class LoginViewMobile extends StatefulWidget {
  const LoginViewMobile({
    super.key,
    required this.loginController,
  });

  final LoginController loginController;

  @override
  _LoginViewMobileState createState() => _LoginViewMobileState();
}

class _LoginViewMobileState extends State<LoginViewMobile> {
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  var loginEnabled = false;
  var showError = false;

  @override
  void dispose() {
    _userNameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _userNameTextController.addListener(() {
      loginEnableCheck();
    });
    _passwordTextController.addListener(() {
      loginEnableCheck();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var storedUsername =
          await LocalStorage().getString(LocalStorageKey.storedUsername);
      var storedPassword =
          await LocalStorage().getString(LocalStorageKey.storedPassword);

      if (storedUsername != null && storedPassword != null) {
        Log.debug("Attempting login with saved user name and password");
        _userNameTextController.text = storedUsername;
        _passwordTextController.text = storedPassword;

        if (mounted) {
          widget.loginController.loginSubmit(
              userName: storedUsername,
              password: storedPassword,
              context: context);
        }
      }
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    var borderColor = showError
        ? const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          )
        : const OutlineInputBorder();

    return Padding(
      padding: const EdgeInsets.only(
        left: paddingDefault,
        right: paddingDefault,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: paddingDefault,
          ),
          Container(
            width: 200,
            height: 200,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              "assets/splash.png",
              width: 200,
              height: 200,
              fit: BoxFit.cover, // Adjust this as per your needs
            ),
          ),
          const SizedBox(
            height: paddingDefault,
          ),
          TextField(
            controller: _userNameTextController,
            decoration: InputDecoration(
              labelText: "Username",
              enabledBorder: borderColor,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: paddingDefault,
          ),
          TextField(
            controller: _passwordTextController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              enabledBorder: borderColor,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: paddingDefault,
          ),
          SizedBox(
            width: 300.0, // Set the button width to 300 pixels
            child: ElevatedButton(
              onPressed: loginEnabled
                  ? () {
                      widget.loginController.loginSubmit(
                          userName: _userNameTextController.text,
                          password: _passwordTextController.text,
                          context: context);

                      setState(() {
                        showError = !widget.loginController.userLoggedIn;
                      });
                    }
                  : null,
              child: const Text("Login"),
            ),
          ),
          const SizedBox(
            height: paddingDefault,
          ),
          if (showError)
            const Text(
              "Login failed. Please check your username and password and try again.",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }

  void loginEnableCheck() {
    final credentialValidation = CredentialValidation();
    var passwordValid = credentialValidation.validatePassword(
        password: _passwordTextController.text);
    var userNameValid = credentialValidation.validateUserName(
        username: _userNameTextController.text);
    setState(() {
      loginEnabled = passwordValid && userNameValid;
    });
  }
}
