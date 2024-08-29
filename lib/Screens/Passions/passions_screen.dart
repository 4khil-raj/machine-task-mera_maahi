import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/Religion/religionScreen.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/addphotos.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/eductation.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/job_status.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/relationship.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/savebutton.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/select_contry.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/thisProfileScreen.dart';
import 'package:mere_maahi_dummy/Screens/Passions/PassionchipViewItem.dart';
import 'package:mere_maahi_dummy/application/auth/auth_bloc_bloc.dart';
import 'package:mere_maahi_dummy/auth/sign_up/signUp_with_email.dart';
import 'package:mere_maahi_dummy/infrastructure/repo/register/repo.dart';

import '../../Widget/CustomImageViewer.dart';
import '../../core/utils/image_constant.dart';

class PassionsScreen extends StatefulWidget {
  const PassionsScreen({super.key});

  @override
  State<PassionsScreen> createState() => _PassionsScreenState();
}

class _PassionsScreenState extends State<PassionsScreen> {
  double? latitude;
  double? longitude;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your interests',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontFamily: 'Sk-Modernist',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Select a few of your interests and let everyone know what you’re passionate about.',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.699999988079071),
                  fontSize: 14,
                  fontFamily: 'Sk-Modernist',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              _buildPassionList(),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () async {
                  await determinePosition();
                  // printAllValues();
                  register();
                  saveProfile();
                  // Get.to(const SignUpScreen(),transition: Transition.rightToLeftWithFade);
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (builder) => const MainScreen()),
                  //     (route) => false);
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
            ],
          ),
        ),
      ),
    );
  }

  void register() {
    UserRegisterRepo model = UserRegisterRepo(
      firstName: signUpfname.text ?? '', // Handle potential null values
      lastName: signUplname.text ?? '',
      email: signUpemailController.text ?? '',
      phone: '', // Assuming you have a controller for phone
      gender: signUpselectedGender ?? '',
      dob: singUpselectedDateOfBirth?.toString() ?? '',
      profileFor: signUpProfileFor ?? '',
      relationshipStatus: signUprelationShip ?? '',
      images: [
        image1!.path,
        image2!.path,
        image3!.path,
        image4!.path
      ], // Ensure these are not null
      interests: Selectedpassionlables ?? [], // Assuming this is a List<String>
      job: Job(
        title: jobtitleController.text ?? '',
        company: companynameController.text ?? '',
        place: whereisController.text ?? '',
      ),
      education: Education(
        qualification: graduateController.text ?? '',
        university: univercityController.text ?? '',
        place: stateController.text ?? '',
      ),
      password: signUppasswordController.text ?? '',
      country: country ?? '',
      state: state ?? '',
      city: city ?? '',
      latitude: latitude ?? 0.0,
      longitude: longitude ?? 0.0,
      religion: signUpselectedCommunity ?? '',
      caste: signUpselectedReligion ?? '',
    );

    print(model);
    BlocProvider.of<AuthBlocBloc>(context)
        .add(SignUpAuthReq(model: model, context: context));
  }

  Future<void> determinePosition() async {
    LocationPermission permission;
    bool serviceEnabled;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, so don't proceed further.
      return Future.error('Location services are disabled.');
    }

    // Check if location permission is granted
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try again
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
  }
  // ///AppBar
  // PreferredSizeWidget _buildAppBar() {
  //   return AppBar(
  //     toolbarHeight: 85,
  //     leadingWidth: 92,
  //     leading: Padding(
  //       padding: const EdgeInsets.only(left: 35.0, top: 25),
  //       child: InkWell(
  //         onTap: () {
  //           Navigator.pop(context);
  //         },
  //         child: Container(
  //           width: 52,
  //           height: 52,
  //           decoration: ShapeDecoration(
  //             color: Colors.white,
  //             shape: RoundedRectangleBorder(
  //               side: const BorderSide(width: 1, color: Colors.grey),
  //               borderRadius: BorderRadius.circular(15),
  //             ),
  //           ),
  //           child: CustomImageView(
  //             imagePath: ImageConstant.imgArrowLeft,
  //             color: Colors.red,
  //           ),
  //         ),
  //       ),
  //     ),
  //     // actions: [
  //     //   Padding(
  //     //     padding: const EdgeInsets.only(top: 12.0, right: 10),
  //     //     child: TextButton(
  //     //       onPressed: () {
  //     //         Navigator.pushAndRemoveUntil(
  //     //             context,
  //     //             MaterialPageRoute(builder: (builder) => const MainScreen()),
  //     //             (route) => false);
  //     //       },
  //     //       child: const Text(
  //     //         'Skip',
  //     //         style: TextStyle(
  //     //           color: Color(0xFFE94057),
  //     //           fontSize: 16,
  //     //           fontFamily: 'Sk-Modernist',
  //     //           fontWeight: FontWeight.w700,
  //     //           height: 0.09,
  //     //         ),
  //     //       ),
  //     //     ),
  //     //   )
  //     // ],
  //   );
  // }

  ///Passion List Widget

  Widget _buildPassionList() {
    return const Wrap(
      runSpacing: 15,
      spacing: 15,
      children: [
        PassionChipViewItem(
          avatarsIcons: Icons.camera_alt,
          labels: 'Photography',
        ),
        PassionChipViewItem(
          avatarsIcons: Icons.art_track,
          labels: 'Art',
        ),
        PassionChipViewItem(
          avatarsIcons: Icons.shopping_cart,
          labels: 'Shopping',
        ),
        PassionChipViewItem(
          avatarsIcons: Icons.mic,
          labels: 'Karaoke',
        ),
        PassionChipViewItem(
          avatarsIcons: Icons.swipe_left_alt,
          labels: 'Swimming',
        ),
        PassionChipViewItem(
          avatarsIcons: Icons.ice_skating,
          labels: 'Yoga',
        ),
        PassionChipViewItem(
          avatarsIcons: Icons.cookie_outlined,
          labels: 'Cooking',
        ),
        PassionChipViewItem(
          avatarsIcons: Icons.travel_explore,
          labels: 'Travelling',
        ),
        PassionChipViewItem(
          avatarsIcons: Icons.sports_tennis,
          labels: 'Tennis',
        ),
        PassionChipViewItem(
          avatarsIcons: Icons.run_circle_outlined,
          labels: 'Run',
        ),
        PassionChipViewItem(
          avatarsIcons: Icons.extension_off_outlined,
          labels: 'Extreme',
        ),
        PassionChipViewItem(
          avatarsIcons: Icons.music_note,
          labels: 'Music',
        ),
        PassionChipViewItem(
          avatarsIcons: Icons.local_drink,
          labels: 'Drink',
        ),
        PassionChipViewItem(
          avatarsIcons: Icons.video_collection_outlined,
          labels: 'Video games',
        ),
        PassionChipViewItem(
          avatarsIcons: Icons.extension_off_outlined,
          labels: 'Extreme',
        ),
      ],
    );
  }

  void printAllValues() {
    print('First Name: ${signUpfname.text}');
    print('Last Name: ${signUplname.text}');
    print('Email: ${signUpemailController.text}');
    // print('Phone: ${phoneController.text}');
    print('Gender: ${signUpselectedGender}');
    print('Date of Birth: ${singUpselectedDateOfBirth}');
    print('Profile For: ${signUpProfileFor}');
    print('Relationship Status: ${signUprelationShip}');
    print('Images: ${[image1, image2, image3, image4]}');
    print('Interests: ${Selectedpassionlables}');
    print('Job Title: ${jobtitleController.text}');
    print('Company: ${companynameController.text}');
    print('Place of Job: ${whereisController.text}');
    print('Qualification: ${graduateController.text}');
    print('University: ${univercityController.text}');
    print('Place of Education: ${stateController.text}');
    print('Password: ${signUppasswordController.text}');
    print('Country: ${country}');
    print('State: ${state}');
    print('City: ${city}');
    print('Latitude: ${latitude}');
    print('Longitude: ${longitude}');
    print('Religion: ${signUpselectedCommunity}');
    print('Caste: ${signUpselectedReligion}');
  }
}
