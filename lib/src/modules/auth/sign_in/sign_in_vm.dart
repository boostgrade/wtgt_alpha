import 'package:where_to_go_today/src/modules/auth/service/state/auth_state.dart';
import 'package:where_to_go_today/src/modules/auth/service/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:where_to_go_today/src/ui/base/view_model.dart';
import 'package:where_to_go_today/src/ui/errors_handling/error_handler.dart';

 class SignInVM extends ViewModel with Store {

   @observable
   String phone = ''; 

  final AuthBloc _bloc;

  SignInVM(
    this._bloc,
    ErrorHandler errorHandler,
  ) : super(errorHandler) {
    observeBloc<AuthState, AuthBloc>(_bloc, _handleStates);
  }
 

  @action
  String validatePhone(phone){
    if (phone?.isEmpty ?? false) {
      debugPrint('Phone is required.');

      return 'empty';
    }
    final RegExp phoneExp = RegExp(r'^[0-9]+$');
    if (!phoneExp.hasMatch(phone!)) {
      debugPrint('Please enter only numeric characters.');

       return 'wrong';
    }

    return 'ok';
  }

  void _handleStates(AuthState state) {
    if (state is LoadingState) {
      debugPrint('Loading');
    } else if (state is SuccessState) {
      debugPrint('Success');
    } else {
      debugPrint('Error');
    }
  }  
}