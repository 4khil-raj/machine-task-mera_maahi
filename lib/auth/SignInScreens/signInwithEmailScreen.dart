// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mere_maahi_dummy/Screens/Main/MainScreen.dart';
import 'package:mere_maahi_dummy/core/app_export.dart';

class SignInWithEmail extends StatefulWidget {
  const SignInWithEmail({super.key});

  @override
  State<SignInWithEmail> createState() => _SignInWithEmailState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
GlobalKey<FormState> _scaffoldKey = GlobalKey<FormState>();
bool isObscure = true;

class _SignInWithEmailState extends State<SignInWithEmail> {
  @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   _scaffoldKey.currentState?.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            key: _scaffoldKey,
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CustomImageView(
                      imagePath: ImageConstant.imgIcon,
                      height: 158,
                      width: 243,
                      margin: const EdgeInsets.only(top: 40),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Login Account',
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 24,
                        fontFamily: 'Arimo',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 24.0,
                    ),
                    child: Text(
                      'Hello, you must login first to be able to use the \napplication and enjoy all the features in Calashop',
                      style: TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 14,
                        fontFamily: 'Arimo',
                        fontWeight: FontWeight.w400,
                        // height: 0.12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 12,
                        fontFamily: 'Arimo',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: _buildEmailTextField(),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 12,
                        fontFamily: 'Arimo',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: _buildPasswordTextField(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 25.0),
                      child: Text(
                        'Forgot Password?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFFEA9459),
                          fontSize: 12,
                          fontFamily: 'Arimo',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Align(
                      alignment: Alignment.center, child: _buildSignInButton()),
                  const SizedBox(
                    height: 24,
                  ),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top: 6, bottom: 8, left: 10, right: 10),
                            child: SizedBox(
                                width: 120,
                                child: Divider(
                                  color: Color(0xFF888888),
                                ))),
                        Text(
                          'Or Sign In With',
                          style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 12,
                            fontFamily: 'Arimo',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                top: 6, bottom: 8, left: 10, right: 10),
                            child: SizedBox(
                                width: 120,
                                child: Divider(
                                  color: Color(0xFF888888),
                                )))
                      ]),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(32),
                          child: Container(
                            width: 155,
                            height: 48,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFAFAFA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/images/google.svg'),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Text(
                                  'Google',
                                  style: TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 14,
                                    fontFamily: 'Arimo',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(32),
                        hoverColor: const Color(0xFFF5F5F5),
                        child: Container(
                          width: 155,
                          height: 48,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFAFAFA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/facebook.svg'),
                              const SizedBox(
                                width: 7,
                              ),
                              const Text(
                                'Facebook',
                                style: TextStyle(
                                  color: Color(0xFF222222),
                                  fontSize: 14,
                                  fontFamily: 'Arimo',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 1, left: 24),
                        child: Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 12,
                            fontFamily: 'Arimo',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color(0xFFEA9459),
                            fontSize: 12,
                            fontFamily: 'Arimo',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  //email
  Widget _buildEmailTextField() {
    return TextFormField(
      controller: _emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFF0F0D23),
            ),
            borderRadius: BorderRadius.circular(20)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        // labelText: 'Email',
        hintText: "roberto@dimo.com",
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        labelStyle: const TextStyle(
          color: Color(0xFF888888),
          fontSize: 12,
          fontFamily: 'Arimo',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
    );
  }

  //Password

  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            child: Icon(
              isObscure ? Icons.visibility_off : Icons.visibility,
              color: isObscure == false ? Colors.red : Colors.grey,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFF0F0D23),
            ),
            borderRadius: BorderRadius.circular(20)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        // labelText: 'Email',
        hintText: "**************",
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        labelStyle: const TextStyle(
          color: Color(0xFF888888),
          fontSize: 12,
          fontFamily: 'Arimo',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
    );
  }

  bool Loading = true;

  ///SignIn Button
  Widget _buildSignInButton() {
    return Loading
        ? Container(
            width: 327,
            height: 56,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFFEC5151),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEC5151),
              ),
              onPressed: () async {
                setState(() {
                  Loading = false;
                });
                await Future.delayed(Duration(seconds: 2));
                setState(() {
                  Loading = true;
                });
                LogIn(context);
                _emailController.clear();
                _passwordController.clear();
              },
              child: const Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Arimo',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          )
        : CircularProgressIndicator(
            color: Colors.red,
          );
  }

  void LogIn(context) async {
    String email = _emailController.text;
    String password = _passwordController.text;
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        showSnackBar(context, "User is successfully logged in");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      } else {
        showSnackBar(context, "Some error happened in Log In");
      }
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('ok'))
            ],
          );
        },
      );
    }
  }

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
