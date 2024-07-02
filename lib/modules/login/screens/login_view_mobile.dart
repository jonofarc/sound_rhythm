import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/login/credentials_validation.dart';
import 'package:sound_rhythm/modules/utils/log.dart';
import 'package:sound_rhythm/shared/shared_preferences/local_storage.dart';
import 'package:sound_rhythm/shared/shared_preferences/local_storage_key.dart';

class LoginViewMobile extends StatefulWidget {
  const LoginViewMobile({
    super.key,
    this.loading = false,
    this.errorMessage = "",
  });

  final bool loading;
  final String errorMessage;

  @override
  _LoginViewMobileState createState() => _LoginViewMobileState();
}

class _LoginViewMobileState extends State<LoginViewMobile> {
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  var loginEnabled = false;

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

        _loginSubmit(userName: storedUsername, password: storedPassword);
      }
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    var borderColor = widget.errorMessage.isNotEmpty
        ? const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          )
        : const OutlineInputBorder();

    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 16.0,
          ),
          const SizedBox(
            height: 16.0,
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
            height: 16.0,
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
            height: 16.0,
          ),
          if (widget.loading) ...[
            const CircularProgressIndicator()
          ] else ...[
            SizedBox(
              width: 300.0, // Set the button width to 300 pixels
              child: ElevatedButton(
                onPressed: loginEnabled
                    ? () {
                        _loginSubmit(
                            userName: _userNameTextController.text,
                            password: _passwordTextController.text);
                      }
                    : null,
                child: const Text("Login"),
              ),
            ),
          ],
          const SizedBox(
            height: 16.0,
          ),
          if (widget.errorMessage.isNotEmpty)
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

  _loginSubmit({required String userName, required String password}) {
    //TODO do login here
  }

  /*
  this function could be refactor  on a more compact way such as

  void loginEnableCheck() {
    final credentialValidation = CredentialValidation();
    setState(() {
      loginEnabled = credentialValidation.validatePassword(
          password: _passwordTextController.text) && credentialValidation.validateUserName(
          username: _userNameTextController.text);
    });
  }

  but separating the validation results makes it more readable and less obfuscated
   */

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
