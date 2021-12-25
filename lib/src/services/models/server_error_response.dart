import 'package:json_annotation/json_annotation.dart';

part 'server_error_response.g.dart';

@JsonSerializable()
class ServerErrorResponse {
  final int code;
  final String message;

  ServerErrorResponse({required this.code, required this.message});

  factory ServerErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ServerErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServerErrorResponseToJson(this);
}
