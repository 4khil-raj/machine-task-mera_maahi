import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/select_contry.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/thisProfileScreen.dart';
import 'package:mere_maahi_dummy/Screens/Passions/passions_screen.dart';
import 'package:mere_maahi_dummy/Widget/CustomImageViewer.dart';
import 'package:mere_maahi_dummy/core/utils/image_constant.dart';

String? relationShip;

class RelationShip extends StatefulWidget {
  const RelationShip({super.key});

  @override
  State<RelationShip> createState() => _RelationShipState();
}

List<DropdownMenuItem<String>> get dropdownItems {
  return [
    const DropdownMenuItem(value: "Single", child: Text("Single")),
    const DropdownMenuItem(
        value: "In a Relationship", child: Text("In a Relationship")),
    const DropdownMenuItem(value: "Married", child: Text("Married")),
    const DropdownMenuItem(value: "Engaged", child: Text("Engaged")),
    const DropdownMenuItem(value: "Divorced", child: Text("Divorced")),
    const DropdownMenuItem(value: "Widowed", child: Text("Widowed")),
    // const DropdownMenuItem(value: "Christianity", child: Text("Christianity")),
  ];
}

class _RelationShipState extends State<RelationShip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://static.vecteezy.com/system/resources/thumbnails/007/256/679/small/rings-glyph-icon-vector.jpg'),
                radius: 50,
                // child: Icon(
                //   Icons.account_circle,
                //   size: 50,
                //   color: Colors.redAccent,
                // ),
              ),
            ),
            const SizedBox(
              height: 95,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Relationship Status',
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
            _buildPassionList(),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  if (relationShip != null) {
                    Get.to(const SelectContry(),
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
                label: 'Single',
                isSelected: relationShip == 'Single',
                onSelect: () {
                  setState(() {
                    relationShip = 'Single';
                  });
                },
              ),
            ),
            Expanded(
              child: PassionschipviewItemWidget(
                label: 'Committed',
                isSelected: relationShip == 'Committed',
                onSelect: () {
                  setState(() {
                    relationShip = 'Committed';
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
                label: 'Engaged',
                isSelected: relationShip == 'Engaged',
                onSelect: () {
                  setState(() {
                    relationShip = 'Engaged';
                  });
                },
              ),
            ),
            Expanded(
              child: PassionschipviewItemWidget(
                label: 'Married',
                isSelected: relationShip == 'Married',
                onSelect: () {
                  setState(() {
                    relationShip = 'Married';
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
                label: 'Divorced',
                isSelected: relationShip == 'Divorced',
                onSelect: () {
                  setState(() {
                    relationShip = 'Divorced';
                  });
                },
              ),
            ),
            Expanded(
              child: PassionschipviewItemWidget(
                label: 'Widowed',
                isSelected: relationShip == 'Widowed',
                onSelect: () {
                  setState(() {
                    relationShip = 'Widowed';
                  });
                },
              ),
            )
          ],
        )
      ],
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
