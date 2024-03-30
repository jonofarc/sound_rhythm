import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:sound_rhythm/modules/utils/song_utils.dart';

class ImageSliderUtils {
  static List<Widget> getCovers() {
    List<Widget> imageSliders = [];
    for (int i = 0; i < SongUtils.songs.length; i++) {
      imageSliders.add(
        Image.asset(
          SongUtils.songs[i].cover, // Path to your asset image
          width: 300,
          height: 300,
        ),
      );
    }
    return imageSliders;
  }
}
