import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:where_to_go_today/src/modules/auth/service/api/models/responses/login_response.dart';
import 'models/requests/login_by_apple_request.dart';
import 'models/requests/login_by_google_request.dart';
import 'models/requests/login_by_meta_request.dart';
import 'models/requests/login_by_phone_request.dart';
import 'models/requests/login_by_vk_request.dart';
import 'models/requests/register_request.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('/login/apple')
  Future<LoginResponse> loginByApple(@Body() LoginByAppleRequest body);

  @POST('/login/google')
  Future<LoginResponse> loginByGoogle(@Body() LoginByGoogleRequest body);

  @POST('/login/meta')
  Future<LoginResponse> loginByMeta(@Body() LoginByMetaRequest body);

  @POST('/login/phone')
  Future<LoginResponse> loginByPhone(@Body() LoginByPhoneRequest body);

  @POST('/login/vk')
  Future<LoginResponse> loginByVk(@Body() LoginByVkRequest body);

  @POST('/register')
  Future<void> register(@Body() RegisterRequest body);

  @POST('/logout')
  Future<void> logout();
}
