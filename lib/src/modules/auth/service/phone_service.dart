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

    final Completer<String> completer = Completer();
    _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: (String verificationId, int? resendToken) async {
        completer.complete(verificationId);
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException error) {},
    );

    _verificationId = await completer.future;

    return true;
  }

  /// return [uid] токен авторизации
  Future<UserCredential> sendSmsCode(String code) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: code,
    );

    try {
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }
}
