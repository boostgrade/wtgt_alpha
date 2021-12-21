import 'package:json_annotation/json_annotation.dart';
part 'login_by_apple_request.g.dart';

@JsonSerializable()
class LoginByAppleRequest {
  final String token;
  LoginByAppleRequest({required this.token});
  factory LoginByAppleRequest.fromJson(Map<String, dynamic> json) => _$LoginByAppleRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginByAppleRequestToJson(this);
}