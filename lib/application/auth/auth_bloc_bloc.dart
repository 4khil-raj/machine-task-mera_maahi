import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/infrastructure/repo/opt/repo.dart';
import 'package:mere_maahi_dummy/infrastructure/repo/register/repo.dart';
import 'package:mere_maahi_dummy/infrastructure/repo/register/signup.dart';
import 'package:meta/meta.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBlocBloc() : super(AuthBlocInitial()) {
    on<AuthBlocEvent>((event, emit) {
      emit(AuthBlocInitial());
    });
    on<SignUpAuthReq>((event, emit) async {
      try {
        final response =
            await SignUpRepo.signUprepo(event.model, event.context);
      } catch (e) {
        emit(AuthErrorState(msg: e.toString()));
      }
    });
    on<OtpValidateEvent>((event, emit) {
      OtpRepos.otpVerify(event.email, event.otp, event.context);
    });
  }
}
