import 'package:json_annotation/json_annotation.dart';
part 'login_by_google_request.g.dart';

@JsonSerializable()
class LoginByGoogleRequest {
  final String content;
  LoginByGoogleRequest({required this.content});
  factory LoginByGoogleRequest.fromJson(Map<String, dynamic> json) => _$LoginByGoogleRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginByGoogleRequestToJson(this);
}