import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:where_to_go_today/firebase_options.dart';

class PhoneService {
  late final FirebaseAuth _auth;
  late String _verificationId;

  Future<void> loginByPhone(String phone) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: (String verificationId, int? resendToken) async {
        _verificationId = verificationId;
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException error) {},
    );
  }

  Future<bool> sendSmsCode(String code) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: code,
    );

    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      return false;
    }

    return true;
  }
}
