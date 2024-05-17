import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mere_maahi_dummy/auth/SignInScreens/signInwithEmailScreen.dart';
import '../../Widget/CustomImageViewer.dart';
import '../../core/utils/image_constant.dart';
import '../../domain/facebookauth/facebook_auth_helper.dart';
import '../../domain/googleauth/google_auth_helper.dart';
import '../SignInScreens/PhoneNumber/phoneNumberScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late bool _isLoading = false;
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
                    Get.to(PhoneNumberScreen(),
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
                      Padding(
                          padding: EdgeInsets.only(top: 6, bottom: 8),
                          child: SizedBox(
                              width: 94, child: Divider(color: Colors.grey))),
                      Text(
                        'or sign up with',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Sk-Modernist',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 6, bottom: 8),
                          child: SizedBox(
                              width: 94, child: Divider(color: Colors.grey)))
                    ]),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 31),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10))),
                            child: IconButton(
                                onPressed: () {
                                  onTapBtnFacebook();
                                },
                                icon: CustomImageView(
                                    color: const Color(0xFFE94057),
                                    imagePath: ImageConstant.imgFacebook)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromARGB(255, 178, 27, 27)),
                                      borderRadius: BorderRadius.circular(10))),
                              child: IconButton(
                                  onPressed: () {
                                    onTapBtnGoogle();
                                  },
                                  icon: CustomImageView(
                                      color: const Color(0xFFE94057),
                                      imagePath: ImageConstant.imgGoogle)),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Container(
                                decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: CustomImageView(
                                      color: const Color(0xFFE94057),
                                      imagePath: ImageConstant.imgUser),
                                ),
                              ))
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

  onTapBtnFacebook() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapBtnGoogle() async {
    // await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
    //   if (googleUser != null) {
    //     //TODO Actions to be performed after signin
    //   } else {
    //     Get.snackbar('Error', 'user data is empty');
    //   }
    // }).catchError((onError) {
    //   Get.snackbar('Error', onError.toString());
    // });
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
      }
    } catch (e) {
      print('Error during Google sign in: ${e.toString()}');
    }
  }
}
