import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:where_to_go_today/src/ui/base/view_model.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? _phoneNumber;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[          
          const SizedBox(height: 24.0),
          // "Phone number" form.
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.phone),
              hintText: 'Where can we reach you?',
              labelText: 'Phone Number *',
              prefixText: '+7',
            ),
            keyboardType: TextInputType.phone,
            onSaved: (String? value) {
              this._phoneNumber = value;
              print('phoneNumber=$_phoneNumber');
            },                     
          ),
        ],
      ),
    );
  }
}

