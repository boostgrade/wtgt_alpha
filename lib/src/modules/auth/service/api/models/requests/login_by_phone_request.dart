import 'package:json_annotation/json_annotation.dart';
part 'login_by_phone_request.g.dart';

@JsonSerializable()
class LoginByPhoneRequest {
  final String token;
  LoginByPhoneRequest({required this.token});
  factory LoginByPhoneRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginByPhoneRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginByPhoneRequestToJson(this);
}
