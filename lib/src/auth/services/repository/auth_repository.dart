import 'package:retrofit/http.dart';
import 'package:where_to_go_today/src/auth/api/models/requests/login_by_apple_request.dart';
import 'package:where_to_go_today/src/auth/api/models/responses/apple_login_response.dart';
import 'package:where_to_go_today/src/domain/token.dart';
import 'package:where_to_go_today/src/auth/services/api/auth_api.dart';
import 'package:where_to_go_today/src/domain/user.dart';

class AuthRepository {
  final AuthApi api;

  AuthRepository({required this.api});
  
   Future<User> loginByApple(LoginByAppleRequest body) async {
     
    final user = api.loginByApple(body);
    
    return User(
      id: id,
      name: name,
      lastName: lastName, 
      phone: phone, 
      email: email, 
      birthDate: birthDate
      )
  }
}
/**
 * Тут должно быть что-то типа RequestClass -> (User + Token) -> Response class 
 */