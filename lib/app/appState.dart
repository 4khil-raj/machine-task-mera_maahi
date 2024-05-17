import 'package:flutter/material.dart';
class AppState {
  SignUpState signUpState;

  // Other properties related to the overall app state could go here

  AppState({
    required this.signUpState,
    // Other properties initialization
  });
}

class SignUpState {
  bool? emailOrPhone;
  TextEditingController? emailController;

  SignUpState({
    this.emailOrPhone,
    this.emailController,
    // Other properties initialization
  });
}
