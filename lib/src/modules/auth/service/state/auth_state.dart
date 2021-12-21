import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class LoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SuccessState extends AuthState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends AuthState {
  @override
  List<Object?> get props => [];
}
