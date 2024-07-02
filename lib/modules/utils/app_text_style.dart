import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  static const String _fontFamily = 'Roboto';
  static final Color _fontColor = Colors.black38;
  static final Color _fontHintColor = Colors.black12;
  static const FontWeight _fontWeight = FontWeight.normal;

  /// Font size 28
  static final TextStyle pageTitle = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 64.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.42,
    height: 32.0 / 28.0,
  );

  /// Font size 28
  static final TextStyle headingH1 = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 28.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.42,
    height: 32.0 / 28.0,
  );

  /// Font size 24
  static final TextStyle headingH2 = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 24.0,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.36,
    height: 32.0 / 24.0,
  );

  /// Font size 20
  static final TextStyle subheadingH3 = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 20.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.3,
    height: 26.0 / 20.0,
  );

  /// Font size 18
  static final TextStyle subheadingH4 = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 18.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.27,
    height: 24.0 / 18.0,
  );

  /// Font size 16
  static final TextStyle subheadingH5 = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.24,
    height: 21.0 / 16.0,
  );

  /// Font size 16
  static final TextStyle subheadingH6 = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.21,
    height: 20.0 / 16.0,
  );

  /// Font size 16
  static final TextStyle normal = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.24,
    height: 24.0 / 16.0,
  );

  /// Font size 14
  static final TextStyle small = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 14.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
  );

  /// Font size 14
  static final TextStyle smallHint = TextStyle(
    color: _fontHintColor,
    fontFamily: _fontFamily,
    fontSize: 14.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
  );

  /// Font size 18
  static final TextStyle large = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 18.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.27,
    height: 24.0 / 18.0,
  );

  /// Font size 14
  static final TextStyle button = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 14.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
  );

  /// Font size 12
  static final TextStyle caption = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 12.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.18,
    height: 16.0 / 12.0,
  );

  /// Font size 12
  static final TextStyle description = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 12.0,
    fontWeight: _fontWeight,
    fontStyle: FontStyle.italic,
    letterSpacing: 0.18,
    height: 16.0 / 12.0,
  );

  static final TextStyle regularTextStyle = TextStyle(
    color: _fontColor,
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: _fontWeight,
    letterSpacing: 0.4,
    height: 34.0 / 16.0,
  );
}

extension CmsTextStyleExtension on TextStyle {
  TextStyle light300() {
    return copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle regularItalic() {
    return copyWith(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
    );
  }

  TextStyle medium500() {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle bold700() {
    return copyWith(fontWeight: FontWeight.w700);
  }

  TextStyle black900() {
    return copyWith(fontWeight: FontWeight.w900);
  }

  TextStyle withColor(Color color) {
    return copyWith(color: color);
  }
}
