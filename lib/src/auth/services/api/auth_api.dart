import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'auth_api.g.dart';


@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('login_apple')
  Future<List<AuthResponse>> getAppleResponses();  

  @POST('login_google')
  Future<List<AuthResponse>> getGoogleResponses();

  @POST('login_meta')
  Future<List<AuthResponse>> getMetaResponses();

  @POST('login_phone')
  Future<List<AuthResponse>> getPhoneResponses();

   @POST('login_vc')
  Future<List<AuthResponse>> getVcResponses();
   
}

@JsonSerializable()
class AuthResponse {
  String? content;

  AuthResponse({this.content});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}