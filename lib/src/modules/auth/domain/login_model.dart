/// Модель пользователя
import 'package:where_to_go_today/src/domain/token.dart';
import 'package:where_to_go_today/src/domain/user.dart';

class LoginModel {
  final User user;
  final Token token;

  LoginModel({
    required this.user,
    required this.token,
  });
}
