import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'main_screen_store.dart';
import 'package:where_to_go_today/src/di/app_dependency.dart';

/// Глвный экран с табами
class MainScreen extends StatelessWidget {
  final MainScreenStore store;

  static const double _labelSize = 12.0;
  // TODO(artem-zaitsev): здесь будут храниться экраны, когда появятся
  final List<Widget> _screens = [
    const Center(
      child: Text('Screen 1'),
    ),
    const Center(
      child: Text('Screen 1'),
    ),
    const Center(
      child: Text('Screen 2'),
    ),
  ];

  MainScreen({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AppDependencies>().dio.get('https://fanta-grooming.ru/ggg');

    return Observer(
      builder: (_) => Scaffold(
        body: _screens[store.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: store.tabClicked,
          currentIndex: store.currentIndex,
          selectedFontSize: _labelSize,
          unselectedFontSize: _labelSize,
          items: [
            // TODO: поменять иконки из дизайна, когда они появятся
            BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              activeIcon: const Icon(
                Icons.search,
              ),
              label: AppLocalizations.of(context)!.placesTabName,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.card_giftcard),
              activeIcon: const Icon(Icons.card_giftcard),
              label: AppLocalizations.of(context)!.cardTabName,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              activeIcon: const Icon(Icons.account_circle),
              label: AppLocalizations.of(context)!.profileTabName,
            ),
          ],
        ),
      ),
    );
  }
}
