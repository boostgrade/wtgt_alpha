import 'package:flutter/material.dart';
import 'package:where_to_go_today/src/ui/res/colors/colors.dart';

/// Виджет, кнопки
/// Требуется передать  в конструкторе заголовок кнопки и callBack функцию
/// Так же есть необязательные парамертры как process для отображения прелоадера
/// и флаг disable блокирование кнопки
class ButtonWidget extends StatelessWidget {
  final String title;
  final bool isProcess;
  final bool isDisable;
  final void Function()? onPressed;

  const ButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isProcess = false,
    this.isDisable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color textColor = isDisable
        ? ProjectColors.textColorDisabled
        : ProjectColors.textColorPrimary;

    return ElevatedButton(
      style: ButtonStyle(
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
      onPressed: isDisable ? null : onPressed,
      child: !isProcess
          ? Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
              ),
            )
          : const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  ProjectColors.preloaderColor,
                ),
              ),
            ),
    );
  }
}
