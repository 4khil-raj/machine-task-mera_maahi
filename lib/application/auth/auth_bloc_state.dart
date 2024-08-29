part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocState {}

final class AuthBlocInitial extends AuthBlocState {}

final class SignUpSuccessState extends AuthBlocState {}

final class LoginSuccessState extends AuthBlocState {}

final class AuthErrorState extends AuthBlocState {
  final String msg;

  AuthErrorState({required this.msg});
}
