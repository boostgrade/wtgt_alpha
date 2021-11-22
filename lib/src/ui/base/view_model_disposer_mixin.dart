import 'package:flutter/widgets.dart';

import 'view_model.dart';

/// Миксин, предоставляющий возможность отписать [ViewModel].
/// Подставляем вьюмоедль через геттер.
mixin ViewModelDisposerMixin<W extends StatefulWidget> on State<W> {
  ViewModel get vm;

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }
}
