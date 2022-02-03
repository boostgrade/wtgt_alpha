// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInVM on _SignInVM, Store {
  final _$isButtonDisableAtom = Atom(name: '_SignInVM.isButtonDisable');

  @override
  bool get isButtonDisable {
    _$isButtonDisableAtom.reportRead();
    return super.isButtonDisable;
  }

  @override
  set isButtonDisable(bool value) {
    _$isButtonDisableAtom.reportWrite(value, super.isButtonDisable, () {
      super.isButtonDisable = value;
    });
  }

  final _$_SignInVMActionController = ActionController(name: '_SignInVM');

  @override
  void sendPhone() {
    final _$actionInfo =
        _$_SignInVMActionController.startAction(name: '_SignInVM.sendPhone');
    try {
      return super.sendPhone();
    } finally {
      _$_SignInVMActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isButtonDisable: ${isButtonDisable}
    ''';
  }
}
