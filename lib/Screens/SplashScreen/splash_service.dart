import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/Main/MainScreen.dart';

import '../OnboardingScreen/onboardingScreen.dart';

String? userId;

class SplashServices {
  void isLogIn(BuildContext, context) async {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      userId = user.email ?? '';

      print('User id :- $userId');
      Timer.periodic(const Duration(seconds: 3), (timer) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen()),
            (route) => false);
      });
    } else {
      Timer.periodic(const Duration(seconds: 3), (timer) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const OnboardingThreeScreen()),
            (route) => false);
      });
    }
  }
}
