import 'package:json_annotation/json_annotation.dart';
part 'meta_login_response.g.dart';

@JsonSerializable()
class MetaLoginResponse {
  final String content;
  MetaLoginResponse({required this.content});
  factory MetaLoginResponse.fromJson(Map<String, dynamic> json) => _$MetaLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MetaLoginResponseToJson(this);
}