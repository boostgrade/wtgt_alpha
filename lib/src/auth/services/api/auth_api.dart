import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:where_to_go_today/src/di/app_dependency.dart';

part 'auth_api.g.dart';
 var baseAppUrl = AppDependencies().dio.options.baseUrl;

@RestApi(baseUrl: 'http://ya.ru')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/tasks")
  Future<List<Response>> getResponses();
}

@JsonSerializable()
class Response {
  String? content;

  Response({this.content});

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}