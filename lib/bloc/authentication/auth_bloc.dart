import 'package:bloc/bloc.dart';
import 'package:book_shop/bloc/authentication/auth_event.dart';
import 'package:book_shop/bloc/authentication/auth_state.dart';
import 'package:book_shop/data/repository/authentication_repository.dart';
import 'package:book_shop/di/di.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthenticationRepository _repository = locator.get();
  AuthBloc() : super(AuthStateInitiate()) {
    on<AuthLoginRequest>((event, emit) async {
      emit(AuthStateLoading());
      var response = await _repository.login(event.username, event.password);
      emit(AuthStateResponse(response));
    });
  }
}
