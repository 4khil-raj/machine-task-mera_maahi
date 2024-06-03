// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/HomeScreen/widgets/account_details.dart';
import 'package:mere_maahi_dummy/Screens/HomeScreen/widgets/appbar.dart';
import 'package:mere_maahi_dummy/Screens/HomeScreen/widgets/home_ads.dart';
import 'package:mere_maahi_dummy/Screens/HomeScreen/widgets/matches_grid.dart';
import 'package:mere_maahi_dummy/Screens/HomeScreen/widgets/options_settings.dart';
import 'package:mere_maahi_dummy/Screens/SplashScreen/splash_service.dart';

class MainScreenNav extends StatelessWidget {
  const MainScreenNav({super.key});

  @override
  Widget build(BuildContext context) {
    userId = FirebaseAuth.instance.currentUser!.email;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 233, 233),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeAppBar(),
            HomeAccountDetailTile(),
            HomeScreenAds(),
            //tile code in whatsapp
            HomeScreenGridView(),
            OptionsAndSetting(),
          ],
        ),
      ),
    );
  }
}
