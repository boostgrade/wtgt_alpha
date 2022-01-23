import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:where_to_go_today/src/modules/auth/sign_in/sign_in_vm.dart';

import 'package:where_to_go_today/src/ui/uikit/button_widget.dart';


class SignInScreen extends StatefulWidget {
  final SignInVM vm;
  const SignInScreen({ Key? key, required this.vm }) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>{
  late final SignInVM vm;
  @override
  void initState(){
    super.initState();
    
  }
  
 @override
  void didChangeDependencies(){
    super.didChangeDependencies();

    vm = widget.vm;
  }

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
           TextField(
            controller: vm.controller,
            keyboardType: TextInputType.number,
          ),
          Observer(
            builder: (_) => ButtonWidget(
             title: 'Отправить',
             onPressed: vm.sendPhone,
             isDisable: vm.isButtonDisable,
            ),
          ),
          
        ],
      ),
    );
  }
}