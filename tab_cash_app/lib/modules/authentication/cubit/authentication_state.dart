part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class LoginLodingState extends AuthenticationState {}

class LoginSucsessState extends AuthenticationState {
  final int phoneNumberState;
  LoginSucsessState(this.phoneNumberState);
}

class LoginErrorState extends AuthenticationState {
  final int errorStatusCodeState;
  LoginErrorState(this.errorStatusCodeState);
}
