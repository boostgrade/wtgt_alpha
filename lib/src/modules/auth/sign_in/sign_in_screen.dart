import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:where_to_go_today/src/modules/auth/sign_in/sign_in_vm.dart';
import 'package:where_to_go_today/src/ui/base/view_model_disposer_mixin.dart';
import 'package:where_to_go_today/src/ui/res/assets/app_assets.dart';
import 'package:where_to_go_today/src/ui/uikit/button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Экран авторизации по номеру телефона
/// https://www.figma.com/file/8wRDN0M82bIuRZS6Uomv8X/Where-to-go-today%3F?node-id=5%3A59

const String prefix = '+7';

class SignInScreen extends StatefulWidget {
  final SignInVM vm;
  final BuildContext context;
  const SignInScreen({
    Key? key,
    required this.vm,
    required this.context,
  }) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with ViewModelDisposerMixin<SignInScreen, SignInVM> {
  late final SignInVM vm;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    vm = widget.vm;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(children: [
              Center(
                child: Image.asset(AppAssets.logo),
              ),
              TextField(
                decoration: InputDecoration(
                  prefixText: prefix,
                  labelText: AppLocalizations.of(context)!.phoneNumber,
                ),
                controller: vm.controller,
                maxLength: phoneMaxLength,
                keyboardType: TextInputType.number,
              ),
            ]),
            SizedBox(
              child: Observer(
                builder: (_) => ButtonWidget(
                  title: AppLocalizations.of(context)!.buttonSendCode,
                  onPressed: vm.sendPhone,
                  isProcess: vm.isLoadingButton,
                  isDisable: vm.isButtonDisable,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
