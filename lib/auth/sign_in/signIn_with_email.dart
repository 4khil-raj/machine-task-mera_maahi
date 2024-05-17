import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mere_maahi_dummy/Screens/Main/MainScreen.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/forgotPassword_screen.dart';
import 'package:mere_maahi_dummy/auth/sign_up/signUp_with_email.dart';

import '../../Const/Style.dart';
import '../../Const/const.dart';
import '../../Const/theme.dart';
import '../../Firebase/firebase_auth_services.dart';
import "../../Screens/Im_and_interests/im.dart";
import '../../components/common_input.dart';
import '../../helpers/deviceInfo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  ///New code
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  late bool isObscure = true;
  late bool _isLoading = false;

  void show_Snack_bar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(msg),
      backgroundColor: Colors.purple,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: DeviceInfo(context).height,
        child: Stack(
          children: [
            buildGradeintLogo(context),
            Positioned.fill(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  Container(
                    width: DeviceInfo(context).width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.0),
                            topRight: Radius.circular(32.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Const.height10,

                            ///BuildEmail
                            buildEmail(context),
                            Const.height15,

                            ///Password
                            password_field(context),
                            Const.height15,
                            forget_password(context),
                            Const.height25,
                            buildLogInButton(context),
                            const SizedBox(
                              height: 30,
                            ),
                            others()
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  ///topLogo
  Container buildGradeintLogo(BuildContext context) {
    return Container(
      height: DeviceInfo(context).height! * 0.40,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: Styles.buildLinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 78,
          ),
          const ImageIcon(
            AssetImage(
              'assets/logo/appbar_logo.png',
            ),
            size: 93,
            color: MyTheme.white,
          ),
          Text(
            'Login to your account',
            style: Styles.bold_white_22,
          ),
          Text(
            'Enter your login credentials',
            style: Styles.regular_white_14,
          )
        ],
      ),
    );
  }

  ///Email
  buildEmail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: Styles.bold_app_accent_12,
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: _emailTextController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter Email';
            }
            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
          decoration:
              InputStyle.inputDecoration_text_field(hint: 'che@gmail.com'),
        )
      ],
    );
  }

  ///Password
  password_field(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: Styles.bold_app_accent_12,
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: _passwordTextController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter password';
            }
            if (value.length <= 7) {
              return "Password should be 8 Characters long";
            }
            return null;
          },
          obscureText: isObscure,
          decoration: InputStyle.inputDecoratio_password(
              hint: ". . . . . . . .",
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  child: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility,
                    color: isObscure == false ? Colors.red : Colors.grey,
                  ))),
        ),
      ],
    );
  }

  ///forgetPassword
  Widget forget_password(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForgotPassword()),
        );
      },
      child: SizedBox(
        width: DeviceInfo(context).width,
        child: Text(
          'Forgot Password ?',
          style: Styles.italic_app_accent_10_underline,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  ///LogIn
  InkWell buildLogInButton(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        _isLoading = true;
        Future<void>.delayed(const Duration(seconds: 2), () {
          setState(() {
            _isLoading = false;
          });
          _LogIn(context);
        });
      }),
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              height: 50,
              width: DeviceInfo(context).width,
              decoration: BoxDecoration(
                gradient: Styles.buildLinearGradient(
                    begin: Alignment.centerLeft, end: Alignment.centerRight),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Center(
                  child: Text(
                'Log In',
                style: Styles.bold_white_14,
              ))),
    );
  }

  ///LogIn function
  void _LogIn(context) async {
    String email = _emailTextController.text;
    String password = _passwordTextController.text;
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        print("User is successfully logged in");
        showSnackBar(context, "User is successfully logged in");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      } else {
        print("Some error happened in Log In");
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
                  child: Text('ok'))
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

  ///others
  Widget others() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create a new account',
              style: TextStyle(
                color: Colors.black.withOpacity(0.699999988079071),
                fontSize: 14,
                fontFamily: 'Sk-Modernist',
                fontWeight: FontWeight.w400,
                height: 0.11,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(SignUpWithEmail(),
                    transition: Transition.upToDown); // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (builder) => const SignUpWithEmail()));
              },
              child: const Text(
                'SignUp',
                style: TextStyle(
                  color: Color(0xFFE94057),
                  fontSize: 14,
                  fontFamily: 'Sk-Modernist',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class IsObscureAction {
  @override
  String toString() {
    return 'IsObscureAction{}';
  }
}
