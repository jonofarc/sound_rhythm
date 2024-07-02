import 'package:flutter/material.dart';
import 'package:sound_rhythm/modules/login/screens/login_screen.dart';
import 'package:sound_rhythm/modules/player/screens/player_screen.dart';
import 'package:sound_rhythm/modules/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: true,
      child: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
