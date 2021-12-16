import 'package:json_annotation/json_annotation.dart';
part 'login_by_meta_request.g.dart';

@JsonSerializable()
class LoginByMetaRequest {
  final String content;
  LoginByMetaRequest({required this.content});
  factory LoginByMetaRequest.fromJson(Map<String, dynamic> json) => _$LoginByMetaRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginByMetaRequestToJson(this);
}