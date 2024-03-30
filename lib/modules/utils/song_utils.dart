import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:sound_rhythm/modules/player/models/song.dart';

class SongUtils {
  static final List<Song> songs = [
    Song(
        source: AssetSource('sounds/Vocalizacion1Pista1.mp3'),
        name: "Vocalización 1 (pista 1).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion1Pista2.mp3'),
        name: "Vocalización 1 (pista 2).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion1Pista3.mp3'),
        name: "Vocalización 1 (pista 3).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion2Pista4.mp3'),
        name: "Vocalización 2 (pista 4).mp3",
        cover: "assets/img/notes6.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion2Pista5.mp3'),
        name: "Vocalización 2 (pista 5).mp3",
        cover: "assets/img/notes0.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion2Pista6.mp3'),
        name: "Vocalización 2 (pista 6).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion2Pista7.mp3'),
        name: "Vocalización 2 (pista 7).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion3Pista8.mp3'),
        name: "Vocalización 3 (pista 8).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion3Pista9.mp3'),
        name: "Vocalización 3 (pista 9).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion3Pista10.mp3'),
        name: "Vocalización 3 (pista 10).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion3Pista11.mp3'),
        name: "Vocalización 3 (pista 11).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Estudio1Pista12.mp3'),
        name: "Estudio 1 (pista 12).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Estudio1Pista13.mp3'),
        name: "Estudio 1 (pista 13).mp3",
        cover: "assets/img/notes0.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion4Pista14.mp3'),
        name: "Vocalización 4 (pista 14).mp3",
        cover: "assets/img/notes6.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion4Pista15.mp3'),
        name: "Vocalización 4 (pista 15).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion4Pista16.mp3'),
        name: "Vocalización 4 (pista 16).mp3",
        cover: "assets/img/notes0.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion4Pista17.mp3'),
        name: "Vocalización 4 (pista 17).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion5Pista18.mp3'),
        name: "Vocalización 5 (pista 18).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion5Pista19.mp3'),
        name: "Vocalización 5 (pista 19).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion5Pista20.mp3'),
        name: "Vocalización 5 (pista 20).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion5Pista21.mp3'),
        name: "Vocalización 5 (pista 21).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion6Pista22.mp3'),
        name: "Vocalización 6 (pista 22).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion6Pista23.mp3'),
        name: "Vocalización 6 (pista 23).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion6Pista24.mp3'),
        name: "Vocalización 6 (pista 24).mp3",
        cover: "assets/img/notes0.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion6Pista25.mp3'),
        name: "Vocalización 6 (pista 25).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Estudio2Pista26.mp3'),
        name: "Estudio 2 (pista 26).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Estudio2Pista27.mp3'),
        name: "Estudio 2 (pista 27).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion7Pista28.mp3'),
        name: "Vocalización 7 (pista 28).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion7Pista29.mp3'),
        name: "Vocalización 7 (pista 29).mp3",
        cover: "assets/img/notes6.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion7Pista30.mp3'),
        name: "Vocalización 7 (pista 30).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion7Pista31.mp3'),
        name: "Vocalización 7 (pista 31).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion8Pista32.mp3'),
        name: "Vocalización 8 (pista 32).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion8Pista33.mp3'),
        name: "Vocalización 8 (pista 33).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion8Pista34.mp3'),
        name: "Vocalización 8 (pista 34).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Vocalizacion8Pista35.mp3'),
        name: "Vocalización 8 (pista 35).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Estudio3Pista36.mp3'),
        name: "Estudio 3 (pista 36).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),
    Song(
        source: AssetSource('sounds/Estudio3Pista37.mp3'),
        name: "Estudio 3 (pista 37).mp3",
        cover: "assets/img/notes${Random().nextInt(9)}.png"),

    //Song(source: AssetSource('sounds/Vocalizacion5.mp3'), name: "name8",cover: "assets/img/notes${Random().nextInt(9)}.png"),
  ];
}
