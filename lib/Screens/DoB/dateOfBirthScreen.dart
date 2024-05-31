import 'package:flutter/material.dart';

import 'package:mere_maahi_dummy/Screens/ChatScreen/push.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/Religion/religionScreen.dart';
import 'package:mere_maahi_dummy/Screens/Im_and_interests/im.dart';

import '../../Widget/CustomImageViewer.dart';
import '../../core/utils/image_constant.dart';

class DOBPickerScreen extends StatefulWidget {
  @override
  _DOBPickerScreenState createState() => _DOBPickerScreenState();
}

class _DOBPickerScreenState extends State<DOBPickerScreen> {
  TextEditingController _yearController = TextEditingController();
  TextEditingController _monthController = TextEditingController();
  TextEditingController _dayController = TextEditingController();
  late DateTime _selectedDate;
  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _yearController.text = DateTime.now().year.toString();
    _monthController.text = DateTime.now().month.toString();
    _dayController.text = DateTime.now().day.toString();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _selectDate(context);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Date of Birth',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SizedBox(
                    width: 80,
                    child: TextField(
                      controller: _dayController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Day',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _monthController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(),
                      border: InputBorder.none,
                      hintText: 'Month',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SizedBox(
                    width: 80,
                    child: TextField(
                      controller: _yearController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Year',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE94057),
              ),
              onPressed: () => _selectDate(context),
              // onPressed: () {
              //   // int year = int.tryParse(_yearController.text) ?? DateTime.now().year;
              //   // int month = int.tryParse(_monthController.text) ?? DateTime.now().month;
              //   // int day = int.tryParse(_dayController.text) ?? DateTime.now().day;
              //   // DateTime selectedDate = DateTime(year, month, day);
              //   // Use the selectedDate as needed
              // },
              child: const Text(
                'Select Date',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 80,
            ),

            //uncomment this and installed packages
//             import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:get/get_navigation/src/routes/transitions_type.dart';
            InkWell(
              onTap: () {
                if (selectedOption != null) {
                  // Get.to(DropdownScreen(), transition: Transition.rightToLeft);
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
    );
  }

  @override
  void dispose() {
    _yearController.dispose();
    _monthController.dispose();
    _dayController.dispose();
    super.dispose();
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
}
