import 'package:where_to_go_today/src/domain/token.dart';
import 'package:where_to_go_today/src/domain/user.dart';
import 'package:where_to_go_today/src/modules/auth/domain/login_model.dart';
import 'package:where_to_go_today/src/modules/auth/service/api/auth_api.dart';
import 'package:where_to_go_today/src/modules/auth/service/api/models/requests/login_by_apple_request.dart';
import 'package:where_to_go_today/src/modules/auth/service/api/models/requests/login_by_google_request.dart';
import 'package:where_to_go_today/src/modules/auth/service/api/models/requests/login_by_meta_request.dart';
import 'package:where_to_go_today/src/modules/auth/service/api/models/requests/login_by_phone_request.dart';
import 'package:where_to_go_today/src/modules/auth/service/api/models/requests/login_by_vk_request.dart';
import 'package:where_to_go_today/src/modules/auth/service/api/models/requests/register_request.dart';
import 'package:where_to_go_today/src/modules/auth/service/api/models/responses/login_response.dart';

class AuthRepository {
  final AuthApi _authApi;
  AuthRepository(this._authApi);

  Future<LoginModel> loginByApple(String appleToken) async {
    final LoginResponse response =
        await _authApi.loginByApple(LoginByAppleRequest(token: appleToken));

    return mapResponseToLoginModel(response);
  }

  Future<LoginModel> loginByGoogle(String googleToken) async {
    final LoginResponse response =
        await _authApi.loginByGoogle(LoginByGoogleRequest(token: googleToken));

    return mapResponseToLoginModel(response);
  }

  Future<LoginModel> loginByMeta(String metaToken) async {
    final LoginResponse response =
        await _authApi.loginByMeta(LoginByMetaRequest(token: metaToken));

    return mapResponseToLoginModel(response);
  }

  Future<LoginModel> loginByPhone(String phoneToken) async {
    final LoginResponse response =
        await _authApi.loginByPhone(LoginByPhoneRequest(token: phoneToken));

    return mapResponseToLoginModel(response);
  }

  Future<LoginModel> loginByVk(String vkToken) async {
    final LoginResponse response =
        await _authApi.loginByVk(LoginByVkRequest(token: vkToken));

    return mapResponseToLoginModel(response);
  }

  Future<void> register(RegisterRequest user) async {
    await _authApi.register(user);
  }

  Future<void> logout() async {
    await _authApi.logout();
  }

  LoginModel mapResponseToLoginModel(LoginResponse response) {
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
