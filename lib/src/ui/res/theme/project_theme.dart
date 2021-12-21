import 'package:flutter/material.dart';
import 'package:where_to_go_today/src/ui/res/colors/colors.dart';

class ProjectTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: ProjectColors.textColorPrimary,
      scaffoldBackgroundColor: ProjectColors.whiteColor,
      fontFamily: 'Montserrat',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: ProjectColors.buttonColor,
          //textStyle: Text, //TODO
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          side: const BorderSide(
            color: ProjectColors.borderColorButton,
          ),
        ),
      ),
      //textTheme: TextTheme(bodyText1: ), //TODO
    );
  }
}
