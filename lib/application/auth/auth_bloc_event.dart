part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocEvent {}

final class SignUpAuthReq extends AuthBlocEvent {
  final UserRegisterRepo model;
  final BuildContext context;

  SignUpAuthReq({
    required this.model,
    required this.context,
  });
}

final class LoginAuthReq extends AuthBlocEvent {
  final String email;
  final String password;

  LoginAuthReq({required this.email, required this.password});
}

final class OtpValidateEvent extends AuthBlocEvent {
  final String otp;
  final String email;
  final BuildContext context;

  OtpValidateEvent({
    required this.email,
    required this.context,
    required this.otp,
  });
}
