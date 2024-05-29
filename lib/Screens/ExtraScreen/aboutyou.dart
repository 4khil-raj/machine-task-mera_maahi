import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mere_maahi_dummy/Const/biodata.dart';
import 'package:mere_maahi_dummy/Firebase/currentuser_repo.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/addphotos.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/select_contry.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/widgets/form_field.dart';
import 'package:mere_maahi_dummy/Widget/CustomImageViewer.dart';
import 'package:mere_maahi_dummy/core/utils/image_constant.dart';

TextEditingController aboutyouController = TextEditingController();

class AboutYou extends StatefulWidget {
  const AboutYou({super.key});

  @override
  State<AboutYou> createState() => _AboutYouState();
}

class _AboutYouState extends State<AboutYou> {
  void initState() {
    // TODO: implement initState
    super.initState();
    aboutyouController = TextEditingController(text: getRandomBiodata());
  }

  String getRandomBiodata() {
    final random = Random();
    int randomIndex = random.nextInt(biodata.length);
    return biodata[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'About you',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: CustomTextFormField(
                  maxline: 7, hintText: '', controller: aboutyouController),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                if (aboutyouController.text.isNotEmpty) {
                  Get.to(const AddYourPhotos(),
                      transition: Transition.rightToLeftWithFade);
                  await updateAbout();
                  CurrentUserRepo().fetchuserdatas();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('fill the details'),
                    backgroundColor: Colors.red,
                  ));
                }
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(builder: (builder) => const MainScreen()),
                //         (route) => false);
              },
              child: Container(
                width: 295,
                height: 56,
                decoration: ShapeDecoration(
                  color: const Color(0xFFE94057),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Sk-Modernist',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateAbout() async {
    FirebaseFirestore.instance
        .collection('userDetails')
        .doc(userAllDetails?.uid)
        .update({'about': aboutyouController.text});
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      toolbarHeight: 85,
      leadingWidth: 92,
      leading: Padding(
        padding: const EdgeInsets.only(left: 35.0, top: 25),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 42,
            height: 42,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowLeft,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
