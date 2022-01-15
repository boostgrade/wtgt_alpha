import 'dart:async';

import 'package:where_to_go_today/src/modules/auth/service/auth_bloc.dart';
import 'package:where_to_go_today/src/modules/auth/service/event/auth_event.dart';
import 'package:where_to_go_today/src/modules/auth/service/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:where_to_go_today/src/ui/base/view_model.dart';
import 'package:where_to_go_today/src/ui/errors_handling/error_handler.dart';

part 'code_vm.g.dart';

class CodeVm = _CodeVm with _$CodeVm;

abstract class _CodeVm extends ViewModel with Store {
  static const int timeLifeCode = 60;

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
    _onStartTimer();

    observeBloc<AuthState, AuthBloc>(_bloc, _handleStates);
  }

  @action
  void refreshCode() {
    _onStartTimer();
  }

  @action
  Future<void> sendSmsCode() async {
    _bloc.add(SendSmsCodeEvent(_code));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void onCodeChanged(String value) {
    isDisabledButton = _code.isEmpty || _code.length < 6 ? true : false;

    _code = value;
  }

  void _onStartTimer() {
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
    } else {
      debugPrint('Hello ErrorState');
    }

    interval = 0;
    isLoadingButton = false;
  }
}
