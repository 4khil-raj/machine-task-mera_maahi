import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mere_maahi_dummy/Firebase/currentuser_repo.dart';
import 'package:mere_maahi_dummy/Screens/DoB/dateOfBirthScreen.dart';

import '../../Widget/CustomImageViewer.dart';
import '../../core/utils/image_constant.dart';
import "../Im_and_interests/im.dart";
import 'Religion/religionScreen.dart';

String? selectedLabel1;

class ThisProfile extends StatefulWidget {
  const ThisProfile({super.key});

  @override
  State<ThisProfile> createState() => _ThisProfileState();
}

class _ThisProfileState extends State<ThisProfile> {
  @override
  Widget build(BuildContext context) {
    CurrentUserRepo().fetchuserdatas();
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  'This Profile is for',
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
              _buildPassionList(),
              const SizedBox(
                height: 70,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    if (selectedLabel1 != null) {
                      Get.to(DropdownScreen(),
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
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildPassionList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PassionschipviewItemWidget(
                label: 'Myself',
                isSelected: selectedLabel1 == 'Myself',
                onSelect: () {
                  setState(() {
                    selectedLabel1 = 'Myself';
                  });
                },
              ),
            ),
            Expanded(
              child: PassionschipviewItemWidget(
                label: 'My Son',
                isSelected: selectedLabel1 == 'My Son',
                onSelect: () {
                  setState(() {
                    selectedLabel1 = 'My Son';
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PassionschipviewItemWidget(
                label: 'My Daughter',
                isSelected: selectedLabel1 == 'My Daughter',
                onSelect: () {
                  setState(() {
                    selectedLabel1 = 'My Daughter';
                  });
                },
              ),
            ),
            Expanded(
              child: PassionschipviewItemWidget(
                label: 'My Sister',
                isSelected: selectedLabel1 == 'My Sister',
                onSelect: () {
                  setState(() {
                    selectedLabel1 = 'My Sister';
                  });
                },
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PassionschipviewItemWidget(
                label: 'My Friends',
                isSelected: selectedLabel1 == 'My Friends',
                onSelect: () {
                  setState(() {
                    selectedLabel1 = 'My Friends';
                  });
                },
              ),
            ),
            Expanded(
              child: PassionschipviewItemWidget(
                label: 'My Relative',
                isSelected: selectedLabel1 == 'My Relative',
                onSelect: () {
                  setState(() {
                    selectedLabel1 = 'My Relative';
                  });
                },
              ),
            )
          ],
        )
      ],
    );
  }

  ///AppBar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      toolbarHeight: 75,
      leadingWidth: 82,
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
      //         Get.to(const ImScreen(),
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

class PassionschipviewItemWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelect;

  const PassionschipviewItemWidget({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.red : Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: RadioListTile(
          activeColor: Colors.red,
          title: Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: isSelected! ? Colors.redAccent : Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          value: label,
          groupValue: isSelected ? label : null,
          onChanged: (value) {
            onSelect();
          },
        ),
      ),
    );
  }
}
