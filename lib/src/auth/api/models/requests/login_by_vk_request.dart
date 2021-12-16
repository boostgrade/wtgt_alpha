import 'package:json_annotation/json_annotation.dart';
part 'login_by_vk_request.g.dart';

@JsonSerializable()
class LoginByVkRequest {
  final String content;
  LoginByVkRequest({required this.content});
  factory LoginByVkRequest.fromJson(Map<String, dynamic> json) => _$LoginByVkRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginByVkRequestToJson(this);
}