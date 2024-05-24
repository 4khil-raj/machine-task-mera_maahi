import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Firebase/currentuser_repo.dart';
import 'package:mere_maahi_dummy/Firebase/fechalldata.dart';
import 'package:mere_maahi_dummy/Screens/SplashScreen/splash_service.dart';
import 'package:mere_maahi_dummy/Widget/CustomImageViewer.dart';

import '../../core/utils/image_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CurrentUserRepo().fetchuserdatas();
    FetchAlUsersDatas().fetchdata();
    splashServices.isLogIn(BuildContext, context);
  }

  @override
  Widget build(BuildContext context) {
    CurrentUserRepo().fetchuserdatas();
    // FetchAlUsersDatas().fetchdata();

    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgRttrecjb9yqkfjt,
              height: 254,
              width: 375,
              radius: BorderRadius.circular(65),
            )
          ],
        ),
      ),
    );
  }
}
