import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class PhoneService {
  late FirebaseAuth _auth;
  late String _verificationId;

  ///Сеттер для токена верификации
  set verificationId(String token) => _verificationId = token;

  Future<Future<String>> loginByPhone(String phone) async {
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

    return completer.future;
  }

  /// return [uid] токен авторизации
  Future<String?> sendSmsCode(String code) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: code,
    );

    try {
      final token = await _auth.signInWithCredential(credential);

      return token.user?.uid;
    } on FirebaseAuthException {
      return null;
    }
  }
}
