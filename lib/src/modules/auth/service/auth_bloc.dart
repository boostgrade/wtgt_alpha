import 'package:bloc/bloc.dart';
import 'package:where_to_go_today/src/modules/auth/service/phone_service.dart';
import 'package:where_to_go_today/src/modules/auth/service/repository/auth_repository.dart';
import 'package:where_to_go_today/src/services/base/throw_exception_bloc.dart';
import 'package:where_to_go_today/src/modules/auth/service/event/auth_event.dart';
import 'package:where_to_go_today/src/modules/auth/service/state/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>
    with CanThrowExceptionBlocMixin {
  final AuthRepository _authRepository;
  final PhoneService _phoneService;

  AuthBloc(this._authRepository, this._phoneService) : super(LoadingState()) {
    on<SendSmsCodeEvent>((event, emit) async {
      emit(LoadingState());

      final uid = await _phoneService.sendSmsCode(event.code);
      if (uid != null && uid.isNotEmpty) {
        emit(SuccessState());
      } else {
        emit(ErrorState());
      }
    });

    // ignore: no-empty-block
    on<LoginBySsoEvent>((event, emit) {
      emit(LoadingState());

      // ignore: todo
      //TODO:реализация метода авторизации через соц сеть

      emit(SuccessState());
    });

    // ignore: no-empty-block
    on<LoginByPhoneEvent>((event, emit) async {
      emit(LoadingState());

      final resultLoginByPhone = await _phoneService.loginByPhone(event.phone);
      await resultLoginByPhone.then((value) {
        _phoneService.verificationId = value;
      }).whenComplete(() => emit(SuccessState()));
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
