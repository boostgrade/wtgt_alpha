import 'package:json_annotation/json_annotation.dart';
import 'package:where_to_go_today/src/domain/user.dart';

class RegisterRequest {
  final User user;
  RegisterRequest({required this.user});
}
