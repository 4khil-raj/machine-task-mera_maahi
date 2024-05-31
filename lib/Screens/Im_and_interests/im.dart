import 'package:flutter/material.dart';

import 'package:mere_maahi_dummy/Screens/ChatScreen/push.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/Religion/religionScreen.dart';
import 'package:mere_maahi_dummy/Screens/Passions/passions_screen.dart';
import 'package:mere_maahi_dummy/core/app_export.dart';

class ImScreen extends StatefulWidget {
  const ImScreen({super.key});

  @override
  State<ImScreen> createState() => _ImScreenState();
}

String selectedOption = '';

class _ImScreenState extends State<ImScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildOption('Male'),
              buildOption('Female'),
              buildOption('other'),
              const SizedBox(
                height: 90,
              ),
              InkWell(
                onTap: () {
                  if (selectedOption != null) {
                    // Get.to(DropdownScreen(),
                    //     transition: Transition.rightToLeft);
                    customNavPush(context, DropdownScreen());
                  }
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
              )
            ],
          ),
        ),
      ),
    );
  }

  ///Section Widget for appBar

  PreferredSizeWidget _buildAppBar() {
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
            width: 52,
            height: 52,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowLeft,
              color: const Color(0xFFE94057),
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0, right: 10),
          child: TextButton(
            onPressed: () {
              // Get.to(DropdownScreen(), transition: Transition.zoom);
              customNavPush(context, DropdownScreen());
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Color(0xFFE94057),
                fontSize: 16,
                fontFamily: 'Sk-Modernist',
                fontWeight: FontWeight.w700,
                height: 0.09,
              ),
            ),
          ),
        )
      ],
    );
  }

  ///Options Widget
  Widget buildOption(String option) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selectedOption = option;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 295,
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black),
              color: selectedOption == option ? const Color(0xFFE94057) : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    option,
                    style: TextStyle(
                      color: selectedOption == option
                          ? Colors.white
                          : Colors.black,
                      fontSize: 16,
                      fontFamily: 'Sk-Modernist',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                    ),
                  ),
                ),
                if (selectedOption == option)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  )
              ],
            ),
          ),
        ));
  }
}

// GestureDetector(
// onTap: () {
// setState(() {
// selectedOption = 'Woman';
// });
// },
// child: Container(
// width: 295,
// height: 58,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(15),
// border: Border.all(color: Colors.black),
// color: selectedOption == 'Woman' ? Colors.red : null,
// ),
// child: Center(
// child: Text(
// 'Woman',
// style: TextStyle(
// color: selectedOption == 'Woman' ? Colors.white : Colors.black,
// fontSize: 16,
// fontFamily: 'Sk-Modernist',
// fontWeight: FontWeight.w400,
// height: 0.09,
// ),
// ),
// ),
// )),
// const SizedBox(height: 10,),
// GestureDetector(
// onTap: () {
// setState(() {
// selectedOption = 'Man';
// });
// },
// child: Container(
// width: 295,
// height: 58,
// decoration: BoxDecoration(
// border: Border.all(color: Colors.black),
// borderRadius: BorderRadius.circular(15),
// color: selectedOption == 'Man' ? Colors.red : null,
// ),
// child:  Center(
// child: Text(
// 'Man',
// style: TextStyle(
// color: selectedOption == 'Man'? Colors.white : Colors.black,
// fontSize: 16,
// fontFamily: 'Sk-Modernist',
// fontWeight: FontWeight.w700,
// height: 0.09,
// ),
// ),
// )
// ),
// ),
