// ignore_for_file: prefer_const_constructors

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/job_status.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/widgets/form_field.dart';
import 'package:mere_maahi_dummy/Widget/CustomImageViewer.dart';
import 'package:mere_maahi_dummy/core/utils/image_constant.dart';
import 'package:csc_picker/csc_picker.dart';

final graduateController = TextEditingController();
final univercityController = TextEditingController();
final stateController = TextEditingController();

final class EducationQualification extends StatefulWidget {
  const EducationQualification({super.key});

  @override
  State<EducationQualification> createState() => _EducationQualificationState();
}

class _EducationQualificationState extends State<EducationQualification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: CircleAvatar(
                  // backgroundImage: NetworkImage(
                  //     'https://static.vecteezy.com/system/resources/thumbnails/007/256/679/small/rings-glyph-icon-vector.jpg'),
                  radius: 50,
                  child: Icon(
                    Icons.school,
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
                  'Educational Status',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                        hintText: 'Degree,Diploma,B-com,etc..',
                        controller: graduateController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        hintText: 'University or College name',
                        controller: univercityController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        hintText: 'Where is your collage',
                        controller: stateController),
                  ],
                ),
              ),
              // Container(
              //     margin: const EdgeInsets.only(left: 15, top: 10, right: 15),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: Colors.grey[200],
              //     ),
              //     child: FormField<String>(
              //       builder: (FormFieldState<String> state) {
              //         return InputDecorator(
              //           decoration: InputDecoration(
              //               contentPadding:
              //                   const EdgeInsets.fromLTRB(12, 10, 20, 20),
              //               border: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(15))),
              //           child: DropdownButtonHideUnderline(
              //             child: DropdownButton<String>(
              //               hint: const Text('Choose '),
              //               value: relationShip,
              //               items: dropdownItems,
              //               onChanged: (String? newValue) {
              //                 setState(() {
              //                   relationShip = newValue;
              //                 });
              //               },
              //             ),
              //           ),
              //         );
              //       },
              //     )),

              const SizedBox(
                height: 50,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    if (graduateController.text.isNotEmpty &&
                        univercityController.text.isNotEmpty &&
                        stateController.text.isNotEmpty) {
                      Get.to(const WorkingorNot(),
                          transition: Transition.rightToLeftWithFade);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Fill the Details'),
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
              )
            ],
          ),
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
}
