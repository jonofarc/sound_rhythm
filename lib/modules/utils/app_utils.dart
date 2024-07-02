import 'package:flutter/material.dart';
import 'package:sound_rhythm/shared/shared_preferences/local_storage.dart';
import 'package:sound_rhythm/shared/shared_preferences/local_storage_key.dart';


class AppUtils {
  // do all the cleaning and logic needed for a logout
  Future<void> doLogout(BuildContext context) async {
    Navigator.of(context).pop();
    clearCredentials();
  }

  Future<void> storeCredentials(
      {required String userName, required String password}) async {
    final localStorage = LocalStorage();
    localStorage.setString(userName,
        localStorageKey: LocalStorageKey.storedUsername);
    localStorage.setString(password,
        localStorageKey: LocalStorageKey.storedPassword);
  }

  Future<void> clearCredentials() async {
    final localStorage = LocalStorage();
    localStorage.remove(localStorageKey: LocalStorageKey.storedUsername);
    localStorage.remove(localStorageKey: LocalStorageKey.storedPassword);
  }
}
