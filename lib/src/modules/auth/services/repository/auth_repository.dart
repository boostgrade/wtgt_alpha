import 'package:where_to_go_today/src/domain/token.dart';
import 'package:where_to_go_today/src/domain/user.dart';
import 'package:where_to_go_today/src/modules/auth/domain/login_model.dart';
import 'package:where_to_go_today/src/modules/auth/services/api/auth_api.dart';
import 'package:where_to_go_today/src/modules/auth/services/api/models/requests/login_by_apple_request.dart';
import 'package:where_to_go_today/src/modules/auth/services/api/models/requests/login_by_google_request.dart';
import 'package:where_to_go_today/src/modules/auth/services/api/models/requests/login_by_meta_request.dart';
import 'package:where_to_go_today/src/modules/auth/services/api/models/requests/login_by_phone_request.dart';
import 'package:where_to_go_today/src/modules/auth/services/api/models/requests/login_by_vk_request.dart';
import 'package:where_to_go_today/src/modules/auth/services/api/models/responses/login_response.dart';

class AuthRepository {
  final AuthApi _authApi;
  AuthRepository(this._authApi);

  Future<LoginModel> loginByApple(String appleToken) async{
    final LoginResponse response  = await _authApi.loginByApple(LoginByAppleRequest(token:appleToken));

    return getLoginModel(response);    
  }

  Future<LoginModel> loginByGoogle(String googleToken) async{
    final LoginResponse response  = await _authApi.loginByGoogle(LoginByGoogleRequest(token:googleToken));

    return getLoginModel(response);    
  }

  Future<LoginModel> loginByMeta(String metaToken) async{
    final LoginResponse response  = await _authApi.loginByMeta(LoginByMetaRequest(token:metaToken));

    return getLoginModel(response);    
  }

  Future<LoginModel> loginByPhone(String phoneToken) async{
    final LoginResponse response  = await _authApi.loginByPhone(LoginByPhoneRequest(token:phoneToken));

    return getLoginModel(response);    
  }

  Future<LoginModel> loginByVk(String vkToken) async{
    final LoginResponse response  = await _authApi.loginByVk(LoginByVkRequest(token:vkToken));

    return getLoginModel(response);    
  }

  Future<void> register(User user) async{
      final void response = user; 

      return response; //
  }

  Future<void> logout() async{
      throw '';      
  }

  LoginModel getLoginModel(response){
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
