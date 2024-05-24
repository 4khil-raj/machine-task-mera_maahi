// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mere_maahi_dummy/Const/Style.dart';
import 'package:mere_maahi_dummy/Const/const.dart';
import 'package:mere_maahi_dummy/Const/theme.dart';
import 'package:mere_maahi_dummy/Firebase/currentuser_repo.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/thisProfileScreen.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/widgets/form_field.dart';
import 'package:mere_maahi_dummy/auth/SignInScreens/signInwithEmailScreen.dart';
import 'package:mere_maahi_dummy/components/common_input.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class OtpProfileBuild extends StatefulWidget {
  const OtpProfileBuild({required this.google, super.key});
  final bool google;
  @override
  State<OtpProfileBuild> createState() => _OtpProfileBuildState();
}

final nameController = TextEditingController();
final emailController = TextEditingController();
// final dobController = TextEditingController();
dynamic selectedVlaue;
dynamic selectedDate;
bool Loading = true;
final passwordController = TextEditingController();

XFile? pickedImage;

class _OtpProfileBuildState extends State<OtpProfileBuild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    XFile? image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    setState(() {
                      pickedImage = image;
                    });
                  },
                  child: CircleAvatar(
                    backgroundImage: pickedImage != null
                        ? FileImage(File(pickedImage!.path))
                        : null,
                    radius: 90,
                    child: pickedImage == null
                        ? const Icon(Icons.add_a_photo)
                        : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                buildName(context),
                SizedBox(
                  height: 10,
                ),
                buildDob(context),
                SizedBox(
                  height: 10,
                ),
                buildGender(context),
                SizedBox(
                  height: 10,
                ),
                widget.google ? SizedBox() : buildEmailTextField(),
                SizedBox(
                  height: 10,
                ),
                buildPasswordTextField(),
                SizedBox(
                  height: 19,
                ),
                buildSignInButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSignInButton() {
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
                widget.google ? buildGoogle() : buildprofile();
                //ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
                // await Future.delayed(Duration(seconds: 2));
              },
              child: const Text(
                'Finish',
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

  //email
  Widget buildEmailTextField() {
    return TextFormField(
      controller: emailController,
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
        hintText: "email@demo.com",
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

  Future<String> postPhoto(photo) async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('${DateTime.now().millisecondsSinceEpoch.toString()}');
    firebase_storage.UploadTask uploadTask = ref.putFile(File(photo));
    await uploadTask;
    var newUrl = await ref.getDownloadURL();
    return newUrl;
  }

  void buildprofile() async {
    final newurls = await postPhoto(pickedImage?.path);

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      CurrentUserRepo().fetchuserdatas();
      setState(() {
        Loading = true;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (phone) => const ThisProfile()));
      await FirebaseFirestore.instance
          .collection('userDetails')
          .doc(userCredential.user?.uid)
          .set({
        'userProfile': newurls,
        'username': nameController.text,
        'gender': selectedVlaue,
        'dob': selectedDate,
        'email': emailController.text,
        'passcode': passwordController.text
      });
    } on FirebaseException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text(e.message.toString()), actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      Loading = true;
                    });
                  },
                  child: Text('ok'))
            ]);
          });
    }
  }

  void buildGoogle() async {
    final newurls = await postPhoto(pickedImage?.path);

    try {
      User? userCredential = FirebaseAuth.instance.currentUser;
      CurrentUserRepo().fetchuserdatas();
      Navigator.push(
          context, MaterialPageRoute(builder: (phone) => const ThisProfile()));
      await FirebaseFirestore.instance
          .collection('userDetails')
          .doc(userCredential?.uid)
          .set({
        'userProfile': newurls,
        'username': nameController.text,
        'gender': selectedVlaue,
        'dob': selectedDate,
        'email': userCredential?.email,
        'passcode': passwordController.text
      });
    } on FirebaseException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text(e.message.toString()), actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      Loading = true;
                    });
                  },
                  child: Text('ok'))
            ]);
          });
    }
  }

  Widget buildPasswordTextField() {
    return TextFormField(
      controller: passwordController,
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
        hintText: "Password",
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

  buildName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter Your Name',
          style: Styles.bold_app_accent_12,
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter First Name';
            }
            return null;
          },
          decoration: InputStyle.inputDecoration_text_field(hint: 'Alexa'),
        )
      ],
    );
  }

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
                selectedVlaue = value;
              });
            },
          ),
        ),
        const SizedBox(
          height: 10,
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
                      content: Text('only 18+ peopels can join'),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Ok'))
                      ],
                    );
                  },
                );
                return;
              }
              setState(() {
                selectedDate = newDate;
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
                      selectedDate == null
                          ? '20/05/2008'
                          : selectedDate.toString().split(' ').first,
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
}
