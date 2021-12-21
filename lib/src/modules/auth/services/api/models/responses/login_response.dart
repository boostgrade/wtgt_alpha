import 'package:json_annotation/json_annotation.dart';
import 'package:where_to_go_today/src/modules/auth/services/api/models/responses/token_response.dart';
import 'package:where_to_go_today/src/modules/auth/services/api/models/responses/user_response.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final UserResponse user;
  final TokenResponse token;
  LoginResponse(this.user, this.token);
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}