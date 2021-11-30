import 'package:where_to_go_today/src/modules/settings/ui/settings_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:where_to_go_today/src/ui/base/view_model.dart';
import 'package:where_to_go_today/src/ui/base/view_model_disposer_mixin.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatefulWidget {
  final SettingsStore store;

  const SettingsView({Key? key, required this.store}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> with ViewModelDisposerMixin {

  @override
  ViewModel get vm => widget.store;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalKey(),
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Observer(
          name: 'Settings',
          builder: (_) => DropdownButton<ThemeMode>(
            // Read the selected themeMode from the controller
            value: widget.store.themeMode,
            // Call the updateThemeMode method any time the user selects a theme.
            onChanged: widget.store.updateTheme,
            items: const [
              DropdownMenuItem(
                value: ThemeMode.system,
                child: Text('System Theme'),
              ),
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Text('Light Theme'),
              ),
              DropdownMenuItem(
                value: ThemeMode.dark,
                child: Text('Dark Theme'),
              ),
              DropdownMenuItem(
                child: Text('null'),
                value: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
