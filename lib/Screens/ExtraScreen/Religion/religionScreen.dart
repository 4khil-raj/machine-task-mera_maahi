import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:mere_maahi_dummy/Screens/Passions/passions_screen.dart';

import '../../../Widget/CustomImageViewer.dart';
import '../../../core/utils/image_constant.dart';

String? selectedItem2;

class DropdownScreen extends StatefulWidget {
  @override
  _DropdownScreenState createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  List<DropdownMenuItem<String>> get dropdownItems {
    return [
      const DropdownMenuItem(value: "Hinduism", child: Text("Hinduism")),
      const DropdownMenuItem(value: "Buddhism", child: Text("Buddhism")),
      const DropdownMenuItem(value: "Sikhism", child: Text("Sikhism")),
      const DropdownMenuItem(value: "Islam", child: Text("Islam")),
      const DropdownMenuItem(value: "Jainism", child: Text("Jainism")),
      const DropdownMenuItem(value: "Taoism", child: Text("Taoism")),
      const DropdownMenuItem(
          value: "Christianity", child: Text("Christianity")),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.account_circle,
                  size: 50,
                  color: Colors.redAccent,
                ),
              ),
            ),
            const SizedBox(
              height: 95,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'His religion',
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
            Container(
                margin: const EdgeInsets.only(left: 15, top: 10, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(12, 10, 20, 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: const Text('Choose Religion'),
                          value: selectedItem2,
                          items: dropdownItems,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedItem2 = newValue;
                            });
                          },
                        ),
                      ),
                    );
                  },
                )),
            const SizedBox(
              height: 90,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  if (selectedItem2 != null) {
                    Get.to(const PassionsScreen(),
                        transition: Transition.rightToLeftWithFade);
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
            )
          ],
        ),
      ),
    );
  }

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
}
