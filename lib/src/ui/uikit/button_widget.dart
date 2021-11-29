import 'package:flutter/material.dart';

/// Виджет, отображающий прогресс
/// Требуется передать  в конструкторе вещественное число
/// Если прогресс меньше единицы - отображается кружок с количеством процентов
/// Если прогресс равен единице - показывается иконка с галочкой
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.title,
    required this.callBackPressed,
  }) : super(key: key);

  final String title;
  final void Function()? callBackPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color.fromRGBO(235, 206, 12, 1),
      ),
      onPressed: callBackPressed,
      child: Text(
        title,
        style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
      ),
    );
  }
}
