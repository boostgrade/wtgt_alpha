import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:where_to_go_today/src/ui/base/view_model_disposer_mixin.dart';
import 'package:where_to_go_today/src/modules/auth/ui/code/code_vm.dart';
import 'package:where_to_go_today/src/ui/res/assets/app_assets.dart';
import 'package:where_to_go_today/src/ui/res/colors/colors.dart';
import 'package:where_to_go_today/src/ui/uikit/button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CodeScreen extends StatefulWidget {
  final CodeVm vm;

  const CodeScreen({Key? key, required this.vm}) : super(key: key);

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen>
    with ViewModelDisposerMixin<CodeScreen, CodeVm> {
  @override
  CodeVm get vm => widget.vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(children: [
                Center(
                  child: Image.asset(AppAssets.logo),
                ),
                TextField(
                  decoration: InputDecoration(
                    counterStyle: const TextStyle(
                      height: double.minPositive,
                    ),
                    counterText: '',
                    labelText: AppLocalizations.of(context)!.codeFromSms,
                  ),
                  controller: vm.controller,
                  maxLength: smsMaxLength,
                ),
                Align(
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
}
