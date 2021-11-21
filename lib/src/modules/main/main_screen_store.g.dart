// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainScreenStore on _MainScreenStore, Store {
  final _$currentIndexAtom = Atom(name: '_MainScreenStore.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$_MainScreenStoreActionController =
      ActionController(name: '_MainScreenStore');

  @override
  void tabClicked(int index) {
    final _$actionInfo = _$_MainScreenStoreActionController.startAction(
        name: '_MainScreenStore.tabClicked');
    try {
      return super.tabClicked(index);
    } finally {
      _$_MainScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
