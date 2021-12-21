import 'package:json_annotation/json_annotation.dart';
part 'token_response.g.dart';
@JsonSerializable()
class TokenResponse {
  final String token;

TokenResponse({required this.token});
  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}
