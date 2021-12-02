import 'package:flutter/material.dart';
import 'package:where_to_go_today/src/ui/res/colors/colors.dart';

/// Виджет, кнопки
/// Требуется передать  в конструкторе заголовок кнопки и callBack функцию
/// Так же есть необязательные парамертры как process для отображения прелоадера
/// и флаг disable блокирование кнопки
class ButtonWidget extends StatelessWidget {
  final String title;
  final bool process;
  final bool disable;
  final void Function()? callBackPressed;

  const ButtonWidget({
    Key? key,
    required this.title,
    required this.callBackPressed,
    this.process = false,
    this.disable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color textColor = (disable
        ? ProjectColors.textColorDisabled
        : ProjectColors.textColorPrimary);

    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.all(8),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            side: BorderSide(color: ProjectColors.borderColorButton),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return ProjectColors.buttonColor;
          },
        ),
      ),
      onPressed: disable ? null : callBackPressed,
      child: !process
          ? Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
              ),
            )
          : const CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(ProjectColors.preloaderColor),
            ),
    );
  }
}
