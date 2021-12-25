// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['id'] as int,
      json['name'] as String,
      json['lastName'] as String,
      json['phone'] as String,
      json['email'] as String,
      json['birthDate'] as String,
      json['photoUrl'] as String,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'birthDate': instance.birthDate,
      'photoUrl': instance.photoUrl,
    };
