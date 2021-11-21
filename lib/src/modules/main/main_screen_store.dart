import 'package:where_to_go_today/src/modules/main/main_screen.dart';
import 'package:mobx/mobx.dart';

part 'main_screen_store.g.dart';

/// MobX экрана [MainScreen]
class MainScreenStore = _MainScreenStore with _$MainScreenStore;

abstract class _MainScreenStore with Store {

  @observable
  int currentIndex = 0;

  @action
  void tabClicked(int index) {
    currentIndex = index;
  }
}