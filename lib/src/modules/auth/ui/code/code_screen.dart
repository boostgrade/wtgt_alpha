import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:where_to_go_today/src/ui/base/view_model_disposer_mixin.dart';
import 'package:where_to_go_today/src/modules/auth/ui/code/code_vm.dart';
import 'package:where_to_go_today/src/ui/res/colors/colors.dart';
import 'package:where_to_go_today/src/ui/uikit/button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class CodeScreen extends StatefulWidget {
  final CodeVm store;

  const CodeScreen({Key? key, required this.store}) : super(key: key);

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen>
    with ViewModelDisposerMixin<CodeScreen, CodeVm> {
  final TextEditingController _controller = TextEditingController();

  @override
  CodeVm get vm => widget.store;

  _CodeScreenState() {
    _controller.addListener(() {
      final String text = _controller.text;
      vm.onCodeChanged(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalKey(),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(children: [
                Center(
                  child: Image.asset('assets/images/where_to_go_today'),
                ),
                TextField(
                  decoration: const InputDecoration(
                    counterStyle: TextStyle(
                      height: double.minPositive,
                    ),
                    counterText: '',
                    labelText: AppLocalizations.of(context)!.codeFromSms,
                  ),
                  controller: _controller,
                  maxLength: 6,
                ),
                Container(
                  //padding: const EdgeInsets.only(top: 32),
                  alignment: Alignment.centerLeft,
                  child: Observer(
                    builder: (_) => Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: vm.interval > 0
                          ? Text.rich(
                              TextSpan(
                                text:
                                    '${AppLocalizations.of(context)!.newCode}: ',
                                children: [
                                  TextSpan(
                                    text:
                                        '${vm.interval} ${AppLocalizations.of(context)!.sec}',
                                    style: const TextStyle(
                                      color: ProjectColors.timer,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : GestureDetector(
                              onTap: vm.refreshCode,
                              child: Text(
                                AppLocalizations.of(context)!.buttonRefreshCode,
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              width: double.infinity,
              // height: double.infinity,
              child: Observer(
                builder: (_) => ButtonWidget(
                  title: AppLocalizations.of(context)!.buttonSendCode,
                  onPressed: vm.sendSmsCode,
                  isProcess: vm.isLoadingButton,
                  isDisable: vm.isDisabledButton,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
