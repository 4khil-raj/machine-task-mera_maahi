import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/push.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/relationship.dart';
import 'package:mere_maahi_dummy/Screens/Passions/passions_screen.dart';

import '../../../Widget/CustomImageViewer.dart';
import '../../../core/utils/image_constant.dart';

String? selectedReligion;
String? selectedCommunity;

class DropdownScreen extends StatefulWidget {
  @override
  _DropdownScreenState createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  final List<String> religions = [
    'Hinduism',
    'Christianity',
    'Islam',
    'Buddhism',
    'Sikhism',
    // Add more religions here
  ];

  final List<List<String>> communities = [
    ['Brahmin', 'Kshatriya', 'Vaishya', 'Shudra'], // Communities for Hinduism
    ['Catholic', 'Protestant', 'Orthodox'], // Communities for Christianity
    ['Sunni', 'Shia'], // Communities for Islam
    ['Theravada', 'Mahayana'], // Communities for Buddhism
    ['Jat', 'Ramgarhia', 'Khatri'], // Communities for Sikhism
    // Add more communities corresponding to the religions here
  ];

  List<String> getCommunitiesForSelectedReligion() {
    if (selectedReligion == null) {
      return [];
    }
    int index = religions.indexOf(selectedReligion!);
    return communities[index];
  }

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
                'Religion',
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                // width:
                // margin: const EdgeInsets.only(left: 15, top: 10, right: 11),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    underline: SizedBox(),
                    isExpanded: true,
                    hint: Text('Select Religion'),
                    value: selectedReligion,
                    onChanged: (value) {
                      setState(() {
                        selectedReligion = value;
                        selectedCommunity =
                            null; // Reset community when religion changes
                      });
                    },
                    items: religions.map((String religion) {
                      return DropdownMenuItem<String>(
                        value: religion,
                        child: Text(religion),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            selectedReligion != null
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                          underline: SizedBox(),
                          hint: Text('Select Community'),
                          isExpanded: true,
                          value: selectedCommunity,
                          onChanged: (value) {
                            setState(() {
                              selectedCommunity = value;
                            });
                          },
                          items: getCommunitiesForSelectedReligion()
                              .map((String community) {
                            return DropdownMenuItem<String>(
                              value: community,
                              child: Text(community),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
            const SizedBox(
              height: 90,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  if (selectedReligion != null && selectedCommunity != null) {
                    // Get.to(const RelationShip(),
                    //     transition: Transition.rightToLeftWithFade);
                    customNavPush(context, RelationShip());
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
    );
  }
}
