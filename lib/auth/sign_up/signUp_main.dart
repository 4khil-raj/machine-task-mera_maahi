// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/thisProfileScreen.dart';
import 'package:mere_maahi_dummy/Screens/Main/MainScreen.dart';
import 'package:mere_maahi_dummy/auth/SignInScreens/PhoneNumber/profile_build.dart';
import 'package:mere_maahi_dummy/auth/SignInScreens/signInwithEmailScreen.dart';
import '../../Widget/CustomImageViewer.dart';
import '../../core/utils/image_constant.dart';
import '../../domain/facebookauth/facebook_auth_helper.dart';
import '../SignInScreens/PhoneNumber/phoneNumberScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late bool _isLoading = false;
  bool button = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 47),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                CustomImageView(
                    imagePath: ImageConstant.imgRttrecjb9yqkfjt207x214,
                    height: 307,
                    width: 254,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 24)),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    Get.to(SignInWithEmail(), transition: Transition.upToDown);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (builder) => const SignUpWithEmail()));
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
                        'Continue with email',
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
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const PhoneNumberScreen(),
                        transition: Transition.downToUp);
                  },
                  child: Container(
                    width: 295,
                    height: 56,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Use phone number',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFE94057),
                          fontSize: 16,
                          fontFamily: 'Sk-Modernist',
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(left: 6, right: 8),
                            child: Divider(color: Colors.grey)),
                      ),
                      Text(
                        'or sign up with',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Sk-Modernist',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 6, bottom: 8, left: 6, right: 8),
                            child: Divider(color: Colors.grey)),
                      )
                    ]),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 31),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Container(
                          //   decoration: ShapeDecoration(
                          //       shape: RoundedRectangleBorder(
                          //           side: const BorderSide(
                          //               width: 1, color: Colors.grey),
                          //           borderRadius: BorderRadius.circular(10))),
                          //   child: IconButton(
                          //       onPressed: () {
                          //         onTapBtnFacebook();
                          //       },
                          //       icon: CustomImageView(
                          //           color: const Color(0xFFE94057),
                          //           imagePath: ImageConstant.imgFacebook)),
                          // ),if this commented buttons is usign give the padding of the google button widgets padding 20
                          button
                              ? const CircularProgressIndicator(
                                  color: Colors.red,
                                )
                              : Container(
                                  decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 1,
                                              color: Color.fromARGB(
                                                  255, 178, 27, 27)),
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          button = true;
                                        });
                                        onTapBtnGoogle(context);
                                      },
                                      icon: CustomImageView(
                                          color: const Color(0xFFE94057),
                                          imagePath: ImageConstant.imgGoogle)),
                                ),
                          // Padding(
                          //     padding: const EdgeInsets.only(left: 25),
                          //     child: Container(
                          //       decoration: ShapeDecoration(
                          //           shape: RoundedRectangleBorder(
                          //               side: const BorderSide(
                          //                   width: 1,
                          //                   color:
                          //                       Color.fromARGB(255, 255, 0, 0)),
                          //               borderRadius:
                          //                   BorderRadius.circular(10))),
                          //       child: IconButton(
                          //         onPressed: () {},
                          //         icon: CustomImageView(
                          //             color: const Color(0xFFE94057),
                          //             imagePath: ImageConstant.imgUser),
                          //       ),
                          //     ))
                        ])),
                const SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: TextButton(
                        onPressed: () {
                          // Get.toNamed(
                          //   AppRoutes.signUpScreen,
                          // );
                        },
                        child: const Text(
                          'Terms of use',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFE94057),
                            fontSize: 14,
                            fontFamily: 'Sk-Modernist',
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                          ),
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: TextButton(
                        onPressed: () {
                          // Get.toNamed(
                          //   AppRoutes.signUpScreen,
                          // );
                        },
                        child: const Text(
                          'Privacy Policy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFE94057),
                            fontSize: 14,
                            fontFamily: 'Sk-Modernist',
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                          ),
                        ),
                      ))
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  // onTapBtnFacebook() async {
  //   await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
  //   }).catchError((onError) {
  //     Get.snackbar('Error', onError.toString());
  //   });
  // }

  onTapBtnGoogle(context) async {
    User? user;
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final creds = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(creds);
        user = userCredential.user;
        bool userfound = await checkEmailExists(user!.email!);
        setState(() {
          button = false;
        });
        if (userfound) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (c) => const OtpProfileBuild(
                        google: true,
                      )));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (phone) => const MainScreen()));
        }
      }
    } on FirebaseException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text(e.message.toString()), actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      button = false;
                    });
                  },
                  child: const Text('ok'))
            ]);
          });
    }
  }

  Future<bool> checkEmailExists(String email) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('userDetails')
        .where('email', isEqualTo: email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      return false;
    }
    return true;
  }
}
