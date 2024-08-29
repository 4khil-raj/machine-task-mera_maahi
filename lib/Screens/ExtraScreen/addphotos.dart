// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:image_picker/image_picker.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/push.dart';
import 'package:mere_maahi_dummy/Screens/Passions/passions_screen.dart';
import 'package:mere_maahi_dummy/Widget/CustomImageViewer.dart';
import 'package:mere_maahi_dummy/core/utils/image_constant.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// dynamic image1;
// dynamic image2;
// dynamic image3;
// dynamic image4;
XFile? image1;
XFile? image2;
XFile? image3;
XFile? image4;

class AddYourPhotos extends StatefulWidget {
  const AddYourPhotos({super.key});

  @override
  State<AddYourPhotos> createState() => _AddYourPhotosState();
}

class _AddYourPhotosState extends State<AddYourPhotos> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Add Photos to complete your Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        XFile? image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        setState(() {
                          image1 = image;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(
                                  File(
                                    image1?.path ?? '',
                                  ),
                                ),
                                fit: BoxFit.cover),
                            color: Color.fromARGB(255, 252, 184, 179)),
                        child: image1 == null
                            ? Icon(
                                Icons.add,
                                color: Colors.red,
                                size: 50,
                              )
                            : null,
                        height: 150,
                        width: 150,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        XFile? image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        setState(() {
                          image2 = image;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(
                                  File(
                                    image2?.path ?? '',
                                  ),
                                ),
                                fit: BoxFit.cover),
                            color: Color.fromARGB(255, 252, 184, 179)),
                        child: image2 == null
                            ? Icon(
                                Icons.add,
                                color: Colors.red,
                                size: 50,
                              )
                            : null,
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        XFile? image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        setState(() {
                          image3 = image;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(
                                  File(
                                    image3?.path ?? '',
                                  ),
                                ),
                                fit: BoxFit.cover),
                            color: Color.fromARGB(255, 252, 184, 179)),
                        child: image3 == null
                            ? Icon(
                                Icons.add,
                                color: Colors.red,
                                size: 50,
                              )
                            : null,
                        height: 150,
                        width: 150,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        XFile? image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        setState(() {
                          image4 = image;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(
                                  File(
                                    image4?.path ?? '',
                                  ),
                                ),
                                fit: BoxFit.cover),
                            color: Color.fromARGB(255, 252, 184, 179)),
                        child: image4 == null
                            ? Icon(
                                Icons.add,
                                color: Colors.red,
                                size: 50,
                              )
                            : null,
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      loading = true;
                    });
                    if (image1 != null &&
                        image2 != null &&
                        image3 != null &&
                        image4 != null) {
                      // image1 = await postPhoto(image1?.path);
                      // image2 = await postPhoto(image2?.path);
                      // image3 = await postPhoto(image3?.path);
                      // image4 = await postPhoto(image4?.path);
                      // Get.to(const PassionsScreen(),
                      //     transition: Transition.rightToLeftWithFade);
                      customNavPush(context, PassionsScreen());
                      setState(() {
                        loading = false;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Choose 4 Images'),
                        backgroundColor: Colors.red,
                      ));
                    }
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(builder: (builder) => const MainScreen()),
                    //         (route) => false);
                  },
                  child: loading
                      ? CircularProgressIndicator(
                          color: Colors.red,
                        )
                      : Container(
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
          )
        ],
      ),
    );
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
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(top: 12.0, right: 10),
      //     child: TextButton(
      //       onPressed: () {
      //         Get.to(const PassionsScreen(),
      //             transition: Transition.rightToLeftWithFade);
      //         // Navigator.pushAndRemoveUntil(
      //         //     context,
      //         //     MaterialPageRoute(builder: (builder) => const MainScreen()),
      //         //         (route) => false);
      //       },
      //       child: const Text(
      //         'Skip',
      //         style: TextStyle(
      //           color: Color(0xFFE94057),
      //           fontSize: 16,
      //           fontFamily: 'Sk-Modernist',
      //           fontWeight: FontWeight.w700,
      //           height: 0.09,
      //         ),
      //       ),
      //     ),
      //   ),
      // ],
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
}
