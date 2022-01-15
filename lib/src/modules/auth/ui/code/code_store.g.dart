// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CodeStore on _CodeStore, Store {
  final _$intervalAtom = Atom(name: '_CodeStore.interval');

  @override
  int get interval {
    _$intervalAtom.reportRead();
    return super.interval;
  }

  @override
  set interval(int value) {
    _$intervalAtom.reportWrite(value, super.interval, () {
      super.interval = value;
    });
  }

  final _$isDisabledButtonAtom = Atom(name: '_CodeStore.isDisabledButton');

  @override
  bool get isDisabledButton {
    _$isDisabledButtonAtom.reportRead();
    return super.isDisabledButton;
  }

  @override
  set isDisabledButton(bool value) {
    _$isDisabledButtonAtom.reportWrite(value, super.isDisabledButton, () {
      super.isDisabledButton = value;
    });
  }

  final _$isLoadingButtonAtom = Atom(name: '_CodeStore.isLoadingButton');

  @override
  bool get isLoadingButton {
    _$isLoadingButtonAtom.reportRead();
    return super.isLoadingButton;
  }

  @override
  set isLoadingButton(bool value) {
    _$isLoadingButtonAtom.reportWrite(value, super.isLoadingButton, () {
      super.isLoadingButton = value;
    });
  }

  final _$sendSmsCodeAsyncAction = AsyncAction('_CodeStore.sendSmsCode');

  @override
  Future<void> sendSmsCode() {
    return _$sendSmsCodeAsyncAction.run(() => super.sendSmsCode());
  }

  final _$_CodeStoreActionController = ActionController(name: '_CodeStore');

  @override
  void refreshCode() {
    final _$actionInfo = _$_CodeStoreActionController.startAction(
        name: '_CodeStore.refreshCode');
    try {
      return super.refreshCode();
    } finally {
      _$_CodeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
interval: ${interval},
isDisabledButton: ${isDisabledButton},
isLoadingButton: ${isLoadingButton}
    ''';
  }
}
