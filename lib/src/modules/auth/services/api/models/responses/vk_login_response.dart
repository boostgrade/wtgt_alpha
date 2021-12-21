import 'package:json_annotation/json_annotation.dart';
part 'vk_login_response.g.dart';

@JsonSerializable()
class VkLoginResponse {
  final String content;
  VkLoginResponse({required this.content});
  factory VkLoginResponse.fromJson(Map<String, dynamic> json) => _$VkLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VkLoginResponseToJson(this);
}