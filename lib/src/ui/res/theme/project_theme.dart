import 'package:flutter/material.dart';
import 'package:where_to_go_today/src/ui/res/colors/colors.dart';
import 'package:where_to_go_today/src/ui/res/typography/typography.dart';

class ProjectTheme {
  /// Стиль границ текстового поля
  static const OutlineInputBorder inputBorder = OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: ProjectColors.borderColorButton),
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
  );

  static ThemeData get lightTheme {
    return ThemeData(
      /// Основные цвета
      primaryColor: ProjectColors.textColorPrimary,
      scaffoldBackgroundColor: ProjectColors.whiteColor,

      /// Основной шрифт и его стили
      fontFamily: 'Montserrat',
      primaryTextTheme: const TextTheme(
        subtitle1: AppTypography.subTitle1,
        bodyText1: AppTypography.body1,
        bodyText2: AppTypography.body2,
        headline5: AppTypography.headLine,
        caption: AppTypography.caption,
      ),

      /// Текстовые поля
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        labelStyle: TextStyle(
          color: ProjectColors.textColorPrimary,
        ),
        contentPadding: EdgeInsets.only(
          left: 15.0,
          top: 16.0,
          bottom: 16.0,
          right: 15.0,
        ),
      ),

      /// Кнопки
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size.fromHeight(44)),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return ProjectColors.buttonColor;
            },
          ),
          side: MaterialStateProperty.resolveWith((_) {
            return const BorderSide(color: ProjectColors.borderColorButton);
          }),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
            return const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            );
          }),
        ),
      ),
    );
  }
}
