import 'package:json_annotation/json_annotation.dart';
part 'phone_login_response.g.dart';

@JsonSerializable()
class PhoneLoginResponse {
  final String content;
  PhoneLoginResponse({required this.content});
  factory PhoneLoginResponse.fromJson(Map<String, dynamic> json) => _$PhoneLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneLoginResponseToJson(this);
}