import 'package:flutter/cupertino.dart';

abstract class AppTypography {
  static const TextStyle storyHeader = TextStyle(
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 144,
    height: 176,
  );

  static const TextStyle subTitle1 = TextStyle(
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 20,
  );

  static const TextStyle headLine = TextStyle(
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    fontSize: 24,
    height: 20,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    height: 20,
    letterSpacing: 0.005,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    height: 20,
    letterSpacing: 0.005,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    height: 20,
  );

  static const TextStyle label = TextStyle(
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 20,
  );

  static const TextStyle promoBold = TextStyle(
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    height: 20,
  );
}