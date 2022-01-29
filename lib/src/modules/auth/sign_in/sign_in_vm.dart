import 'package:where_to_go_today/src/modules/auth/service/event/auth_event.dart';
import 'package:where_to_go_today/src/modules/auth/service/state/auth_state.dart';
import 'package:where_to_go_today/src/modules/auth/service/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:where_to_go_today/src/ui/base/view_model.dart';
import 'package:where_to_go_today/src/ui/errors_handling/error_handler.dart';
part 'sign_in_vm.g.dart';

const int phoneMaxLength = 10;
class SignInVM = _SignInVM with _$SignInVM;

abstract class _SignInVM extends ViewModel with Store {
  final controller = TextEditingController();
  String phone = '';

  @observable
  bool isButtonDisable = true;

  @observable
  bool isLoadingButton = false;

  final AuthBloc _bloc;

  _SignInVM(this._bloc, ErrorHandler errorHandler) : super(errorHandler) {
    controller.addListener(_onChangePhone);
    observeBloc<AuthState, AuthBloc>(_bloc, _handlestate);
  }

  void _handlestate(state) {
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

  void _onChangePhone() {
    phone = controller.text;
    isButtonDisable = phone.length != phoneMaxLength;
  }

  @action
  void sendPhone() {
    debugPrint(phone);
    _bloc.add(SendPhoneEvent(phone));
  }
}
