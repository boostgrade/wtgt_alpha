import 'package:json_annotation/json_annotation.dart';
part 'vc_login_response.g.dart';

@JsonSerializable()
class VcLoginResponse {
  final String content;
  VcLoginResponse({required this.content});
  factory VcLoginResponse.fromJson(Map<String, dynamic> json) => _$VcLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VcLoginResponseToJson(this);
}