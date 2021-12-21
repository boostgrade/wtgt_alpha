import 'package:where_to_go_today/src/domain/token.dart';
import 'package:where_to_go_today/src/domain/user.dart';
import 'package:where_to_go_today/src/modules/auth/domain/login_model.dart';
import 'package:where_to_go_today/src/modules/auth/services/api/auth_api.dart';
import 'package:where_to_go_today/src/modules/auth/services/api/models/requests/login_by_apple_request.dart';
import 'package:where_to_go_today/src/modules/auth/services/api/models/responses/login_response.dart';

class AuthRepository {
  final AuthApi _authApi;
  AuthRepository(this._authApi);
  Future<LoginModel> loginByApple(String appleToken) async{
    final LoginResponse response  = await _authApi.loginByApple(LoginByAppleRequest(token:appleToken));
    
   final user = User(
     id: response.user.id, 
     name: response.user.name,
     lastName: response.user.lastName,
     phone: response.user.phone,
     email: response.user.email,
     birthDate: response.user.birthDate,
     );
    
    final token = Token(token: response.token.token);
    
    return LoginModel(user: user, token: token);      
    
   }

}
