import 'package:bloc/bloc.dart';
import 'package:where_to_go_today/src/services/base/throw_exception_bloc.dart';
import 'package:where_to_go_today/src/modules/auth/service/event/auth_event.dart';
import 'package:where_to_go_today/src/modules/auth/service/state/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>
    with CanThrowExceptionBlocMixin {
  AuthBloc() : super(LoadingState()) {
    // ignore: no-empty-block
    on<SendSmsCodeEvent>((event, emit) {
      emit(LoadingState());

      // ignore: todo
      //TODO:реализация метода по отправки смс

      emit(SuccessState());
    });

    // ignore: no-empty-block
    on<LoginBySsoEvent>((event, emit) {
      emit(LoadingState());

      // ignore: todo
      //TODO:реализация метода авторизации через соц сеть

      emit(SuccessState());
    });

    // ignore: no-empty-block
    on<LoginByPhoneEvent>((event, emit) {
      emit(LoadingState());

      // ignore: todo
      //TODO:реализация метода авторизации через телефон

      emit(SuccessState());
    });

    // ignore: no-empty-block
    on<LogoutEvent>((event, emit) {
      emit(LoadingState());

      // ignore: todo
      //TODO:реализация метода выхода

      emit(SuccessState());
    });

    // ignore: no-empty-block
    on<RegistrationEvent>((event, emit) {
      emit(LoadingState());

      // ignore: todo
      //TODO:реализация метода регистрации

      emit(SuccessState());
    });
  }
}
