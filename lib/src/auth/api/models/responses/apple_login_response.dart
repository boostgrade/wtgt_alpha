import 'package:json_annotation/json_annotation.dart';
part 'apple_login_response.g.dart';

@JsonSerializable()
class AppleLoginResponse {
  final String content;
  AppleLoginResponse({required this.content});
  factory AppleLoginResponse.fromJson(Map<String, dynamic> json) => _$AppleLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppleLoginResponseToJson(this);
}