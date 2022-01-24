import 'dart:async';

import 'package:where_to_go_today/src/modules/auth/service/auth_bloc.dart';
import 'package:where_to_go_today/src/modules/auth/service/event/auth_event.dart';
import 'package:where_to_go_today/src/modules/auth/service/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:where_to_go_today/src/ui/base/view_model.dart';
import 'package:where_to_go_today/src/ui/errors_handling/error_handler.dart';

part 'code_vm.g.dart';

const int smsMaxLength = 6;

class CodeVm = _CodeVm with _$CodeVm;

abstract class _CodeVm extends ViewModel with Store {
  static const int timeLifeCode = 60;

  final TextEditingController controller = TextEditingController();

  @observable
  int interval = timeLifeCode;

  @observable
  bool isDisabledButton = true;

  @observable
  bool isLoadingButton = false;

  String _code = '';

  final AuthBloc _bloc;
  late Timer _timer;

  _CodeVm(
    this._bloc,
    ErrorHandler errorHandler,
  ) : super(errorHandler) {
    _startTimer();

    observeBloc<AuthState, AuthBloc>(_bloc, _handleStates);
  }

  void codeScreenState() {
    controller.addListener(() {
      final String text = controller.text;

      isDisabledButton = text.isEmpty || text.length < smsMaxLength;

      _code = text;
    });
  }

  @action
  void refreshCode() {
    _startTimer();
  }

  @action
  Future<void> sendSmsCode() async {
    _bloc.add(SendSmsCodeEvent(_code));
  }

  @override
  void dispose() {
    _timer.cancel();
    controller.clear();
    super.dispose();
  }

  void _startTimer() {
    interval = timeLifeCode;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (interval == 0) {
        timer.cancel();
      } else {
        interval--;
      }
    });
  }

  void _handleStates(AuthState state) {
    if (state is LoadingState) {
      isLoadingButton = true;
      debugPrint('Hello LoadingState');
    } else if (state is SuccessState) {
      debugPrint('Hello SuccessState');
      isLoadingButton = false;
    } else {
      debugPrint('Hello ErrorState');
    }
  }
}
