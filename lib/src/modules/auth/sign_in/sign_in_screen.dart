import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:where_to_go_today/src/modules/auth/sign_in/sign_in_vm.dart';
import 'package:where_to_go_today/src/ui/base/view_model_disposer_mixin.dart';
import 'package:where_to_go_today/src/ui/res/assets/app_assets.dart';
import 'package:where_to_go_today/src/ui/uikit/button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInScreen extends StatefulWidget {
  final SignInVM vm;
  const SignInScreen({Key? key, required this.vm}) : super(key: key);

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
                    prefixText: '+7',
                    counterStyle: const TextStyle(
                      height: double.minPositive,
                    ),
                    counterText: '',
                    labelText: AppLocalizations.of(context)!.phoneNumber,
                  ),
                  controller: vm.controller,
                  maxLength: phoneMaxLength,
                  keyboardType: TextInputType.number,
                ),
              ]),
            ),
            SizedBox(
              width: double.infinity,
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
