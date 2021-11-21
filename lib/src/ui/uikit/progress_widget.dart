import 'package:where_to_go_today/src/res/colors/colors.dart';
import 'package:flutter/material.dart';

/// Виджет, отображающий прогресс
/// Требуется передать  в конструкторе вещественное число
/// Если прогресс меньше единицы - отображается кружок с количеством процентов
/// Если прогресс равен единице - показывается иконка с галочкой
class ProgressIconWidget extends StatelessWidget {
  const ProgressIconWidget({
    Key? key,
    required this.progress,
  }) : super(key: key);

  final double progress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 1.0,
            color: ProjectColors.activeColor,
            backgroundColor: ProjectColors.divider,
          ),
          progress < 1
              ? Text(
                  '${(progress * 100).toInt()}%',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 8.0,
                  ),
                )
              : const Center(
                child: Icon(
                  Icons.check,
                  color: ProjectColors.activeColor,
                  size: 16.0,
                ),
              ),
        ],
      ),
    );
  }
}
