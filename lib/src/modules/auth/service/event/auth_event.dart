import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

/// Отправка СМС
class SendSmsCodeEvent extends AuthEvent {
  final String phone;

  @override
  List<Object?> get props => [phone];

  SendSmsCodeEvent(this.phone);
}

/// Событие авторизации через соц сети (SSO)
class LoginBySsoEvent extends AuthEvent {
  final Enum type;

  @override
  List<Object?> get props => [type];

  LoginBySsoEvent(this.type);
}

/// Событие авторизации по телефону
class LoginByPhoneEvent extends AuthEvent {
  final String phone;

  @override
  List<Object?> get props => [phone];

  LoginByPhoneEvent(this.phone);
}

/// Событие выхода
class LogoutEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

/// Событие регистрации
class RegistrationEvent extends AuthEvent {
  final String name;
  final String lastName;
  final String phone;
  final DateTime birthDate;

  @override
  List<Object?> get props => [name, lastName, phone, birthDate];

  RegistrationEvent(this.name, this.lastName, this.phone, this.birthDate);
}
