import 'package:json_annotation/json_annotation.dart';
part 'login_by_vk_request.g.dart';

@JsonSerializable()
class LoginByVkRequest {
  final String token;
  LoginByVkRequest({required this.token});
  factory LoginByVkRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginByVkRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginByVkRequestToJson(this);
}
