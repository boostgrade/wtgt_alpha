import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final int id;
  final String name;
  final String lastName;
  final String phone;
  final String email;
  final String birthDate;
  final String photoUrl;

  UserResponse(this.id, this.name, this.lastName, this.phone, this.email,
      this.birthDate, this.photoUrl);
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
