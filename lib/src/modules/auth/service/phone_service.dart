import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class PhoneService {
  late FirebaseAuth _auth;
  late String _verificationId;
  late String _phone;

  String get phone {
    return _phone;
  }

  Future<bool> loginByPhone(String phone) async {
    _phone = phone;

    final Completer<bool> completer = Completer();
    _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: (String verificationId, int? resendToken) async {
        _verificationId = verificationId;
        completer.complete(true);
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException error) {
        completer.complete(false);
      },
    );

    return completer.future;
  }

  Future<UserCredential> sendSmsCode(String code) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: code,
    );

    try {
      return _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }
}
