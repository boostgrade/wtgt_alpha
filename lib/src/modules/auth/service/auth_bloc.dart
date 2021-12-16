import 'package:bloc/bloc.dart';
import 'package:where_to_go_today/src/services/base/throw_exception_bloc.dart';
import 'package:where_to_go_today/src/modules/auth/service/event/auth_event.dart';
import 'package:where_to_go_today/src/modules/auth/service/state/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>
    with CanThrowExceptionBlocMixin {
  AuthBloc() : super(LoadingState()) {
    // ignore: no-empty-block
    on<SendSmsCodeEvent>((event, emit) {});

    // ignore: no-empty-block
    on<LoginBySsoEvent>((event, emit) {});

    // ignore: no-empty-block
    on<LoginByPhoneEvent>((event, emit) {});

    // ignore: no-empty-block
    on<LogoutEvent>((event, emit) {});

    // ignore: no-empty-block
    on<RegistrationEvent>((event, emit) {});
  }
}
