import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:where_to_go_today/src/domain/user.dart';
import 'package:where_to_go_today/src/domain/token.dart';
import 'package:where_to_go_today/src/domain/refresh_token.dart';
import 'package:where_to_go_today/src/modules/auth/services/api/models/responses/login_response.dart';

import 'models/requests/login_by_apple_request.dart';
import 'models/requests/login_by_google_request.dart';
import 'models/requests/login_by_meta_request.dart';
import 'models/requests/login_by_phone_request.dart';
import 'models/requests/login_by_vk_request.dart';

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
   
}