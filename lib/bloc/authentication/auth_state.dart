import 'package:dartz/dartz.dart';

abstract class AuthState {}

class AuthStateInitiate extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateResponse extends AuthState {
  Either<String, String> response;
  AuthStateResponse(this.response);
}
