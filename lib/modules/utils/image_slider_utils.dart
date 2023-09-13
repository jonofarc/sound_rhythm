import 'package:flutter/widgets.dart';

class ImageSliderUtils {
  static List<Widget> getCovers() {

    List<Widget> imageSliders = [];
    for (int i = 0; i <= 8; i++) {
      imageSliders.add(
        Image.asset(
          'assets/img/notes$i.png', // Path to your asset image
          width: 300,
          height: 300,
        ),
      );
    }
    return imageSliders;

  }


}
