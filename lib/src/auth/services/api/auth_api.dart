import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:where_to_go_today/src/auth/api/models/requests/login_by_apple_request.dart';
import 'package:where_to_go_today/src/auth/api/models/requests/login_by_google_request.dart';
import 'package:where_to_go_today/src/auth/api/models/requests/login_by_meta_request.dart';
import 'package:where_to_go_today/src/auth/api/models/requests/login_by_phone_request.dart';
import 'package:where_to_go_today/src/auth/api/models/requests/login_by_vk_request.dart';
import 'package:where_to_go_today/src/domain/user.dart';
import 'package:where_to_go_today/src/domain/token.dart';
import 'package:where_to_go_today/src/domain/refresh_token.dart';
part 'auth_api.g.dart';


@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('/login/apple')
  Future<AuthResponse> loginByApple(@Body() LoginByAppleRequest body);

  @POST('/login/google')
  Future<AuthResponse> loginByGoogle(@Body() LoginByGoogleRequest body);

  @POST('/login/meta')
  Future<AuthResponse> loginByMeta(@Body() LoginByMetaRequest body);

  @POST('/login/phone')
  Future<AuthResponse> loginByPhone(@Body() LoginByPhoneRequest body);

   @POST('login_vk')
  Future<AuthResponse> loginByVk(@Body() LoginByVkRequest body);
   
}

@JsonSerializable()
class AuthResponse {
  final Token token;
  final RefreshToken overtoken;
  final User user;

  AuthResponse({required this.token, required this.overtoken, required this.user }); 

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}