import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/aboutyou.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/addphotos.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/thisProfileScreen.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/widgets/form_field.dart';
import 'package:mere_maahi_dummy/Widget/CustomImageViewer.dart';
import 'package:mere_maahi_dummy/core/utils/image_constant.dart';

String? areyouworking;
final jobtitleController = TextEditingController();
final companynameController = TextEditingController();
final whereisController = TextEditingController();

class WorkingorNot extends StatefulWidget {
  const WorkingorNot({super.key});

  @override
  State<WorkingorNot> createState() => _WorkingorNotState();
}

bool working = false;

class _WorkingorNotState extends State<WorkingorNot> {
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
                    Icons.work,
                    size: 50,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              SizedBox(
                height: working ? 15 : 80,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Are You Working..?',
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
              _buildPassionList(),
              working
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CustomTextFormField(
                              hintText: 'Job Title',
                              controller: jobtitleController),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                              hintText: 'Company name',
                              controller: companynameController),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                              hintText: 'Where is your company',
                              controller: whereisController),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    if (areyouworking != null) {
                      if (working == false) {
                        Get.to(const AboutYou(),
                            transition: Transition.rightToLeftWithFade);
                      } else if (working &&
                          jobtitleController.text.isNotEmpty &&
                          companynameController.text.isNotEmpty &&
                          whereisController.text.isNotEmpty) {
                        Get.to(const AboutYou(),
                            transition: Transition.rightToLeftWithFade);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('fill all details'),
                          backgroundColor: Colors.red,
                        ));
                      }
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
                label: 'Iam Working',
                isSelected: areyouworking == 'Iam Working',
                onSelect: () {
                  setState(() {
                    working = true;
                    areyouworking = 'Iam Working';
                  });
                },
              ),
            ),
            Expanded(
              child: PassionschipviewItemWidget(
                label: 'Not Working',
                isSelected: areyouworking == 'Not Working',
                onSelect: () {
                  setState(() {
                    working = false;
                    areyouworking = 'Not Working';
                  });
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70, right: 70),
          child: PassionschipviewItemWidget(
            label: 'Iam Studying',
            isSelected: areyouworking == 'Iam Studying',
            onSelect: () {
              setState(() {
                working = false;
                areyouworking = 'Iam Studying';
              });
            },
          ),
        ),
      ],
    );
  }
}
