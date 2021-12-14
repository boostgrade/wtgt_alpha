import 'package:json_annotation/json_annotation.dart';
part 'google_login_response.g.dart';

@JsonSerializable()
class GoogleLoginResponse {
  final String content;
  GoogleLoginResponse({required this.content});
  factory GoogleLoginResponse.fromJson(Map<String, dynamic> json) => _$GoogleLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleLoginResponseToJson(this);
}