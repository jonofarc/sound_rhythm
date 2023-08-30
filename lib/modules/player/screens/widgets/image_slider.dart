import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider(
      {super.key,
      required this.imageSliders,
      required this.songChangedCallback});

  final List<Widget> imageSliders;
  final dynamic Function(int, CarouselPageChangedReason)? songChangedCallback;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: songChangedCallback,
        enableInfiniteScroll: false,
        autoPlay: false,
        aspectRatio: 2.0,
        viewportFraction: 0.5,
        enlargeCenterPage: true,
      ),
      items: imageSliders,
    );
  }
}
