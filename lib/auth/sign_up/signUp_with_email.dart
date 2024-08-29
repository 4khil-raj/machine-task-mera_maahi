// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mere_maahi_dummy/Const/biodata.dart';
import 'package:mere_maahi_dummy/Const/theme.dart';
import 'package:mere_maahi_dummy/Firebase/firebase_auth_services.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/push.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/thisProfileScreen.dart';
import 'package:mere_maahi_dummy/auth/sign_in/signIn_with_email.dart';
import 'package:mere_maahi_dummy/components/common_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../Const/Style.dart';
import '../../Const/const.dart';
import '../../helpers/deviceInfo.dart';

final TextEditingController signUpfname = TextEditingController();
TextEditingController signUplname = TextEditingController();
TextEditingController signUpemailController = TextEditingController();
TextEditingController signUppasswordController = TextEditingController();
TextEditingController signUpconfirmPasswordController = TextEditingController();
dynamic signUpselectedGender;
dynamic singUpselectedDateOfBirth;

class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({
    super.key,
  });

  @override
  State<SignUpWithEmail> createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final _formKey = GlobalKey<FormState>();
  late bool _isObscure = true;
  late bool isObscure = true;
  late final bool emailOrPhone;

  bool isLoading = false;

  // _sgnup(AppState state) {
  //   setState(() {
  //     isLoading = true;
  //     // Perform signup logic here
  //     // ...
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // aboutyouController = TextEditingController(text: getRandomBiodata());
  }

  String getRandomBiodata() {
    final random = Random();
    int randomIndex = random.nextInt(biodata.length);
    return biodata[randomIndex];
  }

  ///SnackBar
  void show_Snackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: Colors.red,
    ));
  }

  // TextEditingController aboutyouController = TextEditingController();
  XFile? selectedImage;
  bool imageselected = false;
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ///onBehalf
                            // buildOnBehalf(context),

                            ///First Name

                            buildFirstName(context),

                            ///Last Name
                            buildLastName(context),

                            ///Gender
                            buildGender(context),

                            ///Dob(Date of Birth)
                            buildDob(context),

                            ///BuildEmail
                            buildEmail(context),

                            ///Password
                            buildPassword(context),

                            ///Confirm Password
                            dConfirmPassword(context),

                            buildSignUpButton(context),
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
            'Create your account',
            style: Styles.bold_white_22,
          ),
          Text(
            'Fill out the form to get Started',
            style: Styles.regular_white_14,
          )
        ],
      ),
    );
  }

  ///onBehalf
  buildOnBehalf(BuildContext context) {
    dynamic selectedVlaue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'On behalf',
          style: Styles.bold_app_accent_12,
        ),
        Const.height5,
        SizedBox(
          height: 49,
          child: DropdownButtonFormField<dynamic>(
            iconSize: 0.0,
            decoration: InputStyle.inputDecoration_text_field(
                suffixIcon: const Icon(Icons.keyboard_arrow_down)),
            items: ['Self', 'Friend', 'Brother'].map((value) {
              return DropdownMenuItem<dynamic>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedVlaue = value;
              });
            },
          ),
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }

  Future<String> postPhoto(photo) async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('${DateTime.now().millisecondsSinceEpoch.toString()}');
    firebase_storage.UploadTask uploadTask = ref.putFile(File(photo));
    await uploadTask;
    var newUrl = await ref.getDownloadURL();
    return newUrl;
  }

  ///First name
  buildFirstName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'First Name',
          style: Styles.bold_app_accent_12,
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: signUpfname,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter First Name';
            }
            return null;
          },
          decoration: InputStyle.inputDecoration_text_field(hint: 'Saket'),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  ///Last name
  buildLastName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Last Name',
          style: Styles.bold_app_accent_12,
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: signUplname,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter First Name';
            }
            return null;
          },
          decoration: InputStyle.inputDecoration_text_field(hint: 'kumar'),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  ///Gender
  buildGender(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: Styles.bold_app_accent_12,
        ),
        Const.height5,
        SizedBox(
          height: 49,
          child: DropdownButtonFormField<dynamic>(
            iconSize: 0.0,
            decoration: InputStyle.inputDecoration_text_field(
                suffixIcon: const Icon(Icons.keyboard_arrow_down)),
            items: [
              'Male',
              'Female',
            ].map((value) {
              return DropdownMenuItem<dynamic>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                signUpselectedGender = value;
              });
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  ///Dob(Date of Birth)
  buildDob(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of Birth',
          style: Styles.bold_app_accent_12,
        ),
        const SizedBox(
          height: 5,
        ),
        TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: MyTheme.solitude),
            onPressed: () async {
              DateTime? newDate = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1945),
                  initialDate: DateTime(2002),
                  lastDate: DateTime(2024));
              if (newDate!.year > 2008) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text('only 18+ peopels can join'),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Ok'))
                      ],
                    );
                  },
                );
                return;
              }
              setState(() {
                singUpselectedDateOfBirth = newDate;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text(
                      singUpselectedDateOfBirth == null
                          ? '20/05/2008'
                          : singUpselectedDateOfBirth
                              .toString()
                              .split(' ')
                              .first,
                      style: Styles.regular_app_accent_14,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: MyTheme.gull_grey,
                  ),
                ],
              ),
            )),
        const SizedBox(
          height: 18,
        )
      ],
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
          controller: signUpemailController,
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
              InputStyle.inputDecoration_text_field(hint: 'che@gmai.com'),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  ///Password
  buildPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(
              color: MyTheme.app_accent_color,
              fontWeight: FontWeight.bold,
              fontSize: 11),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
            controller: signUppasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              }
              if (value.length <= 7) {
                return "Password should be 8 Charecters long";
              }
              return null;
            },
            obscureText: _isObscure,
            decoration: InputStyle.inputDecoratio_password(
              hint: ". . . . . . .",
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  child: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: _isObscure == false ? Colors.red : Colors.grey,
                  )),
            )),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: DeviceInfo(context).width,
          child: Text(
            'User 8 or more character',
            style: Styles.regular_gull_grey_10,
            textAlign: TextAlign.right,
          ),
        ),
        // const SizedBox(
        //   height: 20,
        // ),
      ],
    );
  }

  ///Confirm Password
  dConfirmPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Confirm Password',
          style: TextStyle(
              color: MyTheme.app_accent_color,
              fontWeight: FontWeight.bold,
              fontSize: 11),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: signUpconfirmPasswordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Confirm Password';
            }
            if (signUppasswordController.text.toString() !=
                signUpconfirmPasswordController.text.toString()) {
              return "Password don't match";
            }
            return null;
          },
          obscureText: _isObscure,
          decoration: InputStyle.inputDecoratio_password(
              hint: ". . . . . . .",
              // suffixIcon: Icon(Icons.remove_red_eye),
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
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  /// SignUp Button
  buildSignUpButton(BuildContext context) {
    return InkWell(
        onTap: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ThisProfile()));
          setState(() {
            isLoading = true;
          });
          bool emailExists = await checkEmailExists(signUpemailController.text);
          if (emailExists) {
            return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: const Text('The Email is Alredy Exists'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {
                                isLoading = false;
                              });
                            },
                            child: const Text('Ok'))
                      ]);
                });
          } else {
            setState(() {
              isLoading = true;
              Future<void>.delayed(const Duration(seconds: 2), () {
                setState(() {
                  isLoading = false;
                });
                if (true) {}
                // _signUp();
              });
            });
            final newurls = await postPhoto(selectedImage?.path);
            UserCredential userCredential = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: signUpemailController.text,
                    password: signUppasswordController.text);
            try {
              await FirebaseFirestore.instance
                  .collection('userDetails')
                  .doc(userCredential.user!.uid)
                  .set({
                'about': 'Hey Iam ${signUpfname.text + signUplname.text}',
                'uid': userCredential.user?.uid,
                'userProfile': newurls,
                'username': signUpfname.text + signUplname.text,
                'gender': signUpselectedGender,
                'dob': singUpselectedDateOfBirth,
                'email': signUpemailController.text,
                'passcode': signUpconfirmPasswordController.text
              });
            } on FirebaseException catch (e) {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        content: Text(e.message.toString()),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Ok'))
                        ]);
                  });
            }
          }
        },
        child: Container(
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
              'Sign Up',
              style: Styles.bold_white_10,
            ))));
  }

  Widget others() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'I have an account?',
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
                customNavPush(context, SignInScreen());
                // Get.to(const SignInScreen(), transition: Transition.downToUp);
              },
              child: const Text(
                ' Sign In',
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

  Future<bool> checkEmailExists(forgetEmailController) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('userDetails')
        .where('email', isEqualTo: forgetEmailController)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return false;
    }
    return true;

    // return querySnapshot.docs.isNotEmpty == querySnapshot1.docs.isNotEmpty;
  }
}
