import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Firebase/currentuser_repo.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/push.dart';
import 'package:mere_maahi_dummy/Screens/Main/MainScreen.dart';

import '../OnboardingScreen/onboardingScreen.dart';

String? userId;

class SplashServices {
  void isLogIn(BuildContext, context) async {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;
    await CurrentUserRepo().fetchuserdatas();
    if (user != null) {
      userId = user.email ?? '';

      // Timer.periodic(const Duration(seconds: 3), (timer) {
      //   Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(builder: (context) => const MainScreen()),
      //       (route) => false);
      // });

      await Future.delayed(Duration(seconds: 3), () {
        customNavRemoveuntil(context, const MainScreen());
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
