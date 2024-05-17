import 'dart:io';
import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mere_maahi_dummy/Profile/profile_screen.dart';
import 'package:mere_maahi_dummy/Screens/ProfileScreen/Profile_Details_screen.dart';

import '../../Widget/CustomImageViewer.dart';
import '../../core/utils/image_constant.dart';
import '../../routes/app_routes.dart';

class MainScreenNav extends StatefulWidget {
  const MainScreenNav({super.key});

  @override
  State<MainScreenNav> createState() => _MainScreenNavState();
}

//adjusted the height in the filter section

class _MainScreenNavState extends State<MainScreenNav> {
  List images = [
    'assets/images/img1.jpg',
    'assets/images/img.jpg',
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
    'assets/images/img5.jpg',
    'assets/images/img6.jpg',
    'assets/images/img7.jpg',
  ];

  List<String> textValues = [
    'Chicago 1',
    'Chicago 2',
    'Chicago 3',
  ];
  double _distance = 0.0;
  double _distanceAge = 0.0;
  int current_page = 0;
  String selectedGender = '';
  TextEditingController locationController = TextEditingController();
  String selectedLocation = '';
  List<String> locations = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Miami'
  ];

  ///Exit Dialog
  Future<void> _showExitConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Are you sure you want to exit the application?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Dismiss the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.of(context).pop(true); // Dismiss the dialog
              },
              child: const Text('Exit'),
            ),
          ],
        );
      },
    ).then((value) {
      if (value != null && value) {
        _exitApp();
      }
    });
  }

  ///ExitApp Function
  void _exitApp() {
    // This is where you would exit the app. We use exit(0) as an example.
    // Ensure that you handle this carefully and consider user experience.
    print('Exiting the application');
    exit(0);
  }

  ///Filters Sheet

  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Flexible(
                      child: Text(
                    'Filters',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Sk-Modernist',
                      fontWeight: FontWeight.w700,
                      height: 0.06,
                    ),
                  )),
                  TextButton(
                      onPressed: () {
                        // Implement logic to clear filters
                      },
                      child: const Text(
                        'Clear',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFFE94057),
                          fontSize: 16,
                          fontFamily: 'Sk-Modernist',
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                        ),
                      )),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .01),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Interested in',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Sk-Modernist',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .01),
                  Container(
                    width: 295,
                    height: 58,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFE8E6EA)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 97,
                          height: 58,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFE94057),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                            ),
                          ),
                          child: const SizedBox(
                            width: 58,
                            child: Center(
                              child: Text(
                                'Girls',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Sk-Modernist',
                                  fontWeight: FontWeight.w700,
                                  height: 0.11,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 98,
                          height: 58,
                          decoration: const ShapeDecoration(
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(
                                // borderRadius: BorderRadius.only(
                                //   topLeft: Radius.circular(15),
                                //   bottomLeft: Radius.circular(15),
                                // ),
                                ),
                          ),
                          child: const SizedBox(
                            width: 58,
                            child: Center(
                              child: Text(
                                'Boys',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Sk-Modernist',
                                  fontWeight: FontWeight.w700,
                                  height: 0.11,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 98,
                          height: 58,
                          decoration: const ShapeDecoration(
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15))),
                          ),
                          child: const SizedBox(
                            width: 58,
                            child: Center(
                              child: Text(
                                'Both',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Sk-Modernist',
                                  fontWeight: FontWeight.w700,
                                  height: 0.11,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              // Add your interested in options here (e.g., dropdown, checkboxes).
              SizedBox(height: MediaQuery.of(context).size.height * .02),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'location',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              // Add your distance options here (e.g., slider, dropdown).
              SizedBox(height: MediaQuery.of(context).size.height * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Distance',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Sk-Modernist',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                    ),
                  ),
                  Text(
                    '${_distance.toStringAsFixed(2)} km',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.699999988079071),
                      fontSize: 14,
                      fontFamily: 'Sk-Modernist',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .01),
              Slider(
                value: _distance,
                min: 0.0,
                max: 100.0,
                divisions: 100,
                label: '$_distance',
                onChanged: (value) {
                  setState(() {
                    _distance = value;
                  });
                },
                inactiveColor: Colors.red,
                activeColor: Colors.red,
              ),
              // Add your age filter options here (e.g., range slider, dropdown).
              SizedBox(height: MediaQuery.of(context).size.height * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Age',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Sk-Modernist',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                    ),
                  ),
                  Text(
                    _distanceAge.toStringAsFixed(2),
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.699999988079071),
                      fontSize: 14,
                      fontFamily: 'Sk-Modernist',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .01),
              Slider(
                value: _distanceAge,
                min: 0.0,
                max: 100.0,
                divisions: 100,
                label: '$_distanceAge',
                onChanged: (value) {
                  setState(() {
                    _distanceAge = value;
                  });
                },
                inactiveColor: Colors.red,
                activeColor: Colors.red,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              SizedBox(
                width: 270,
                height: 57,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE94057),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Close the bottom sheet
                    // Implement filter logic here based on selected options
                  },
                  child: const Text(
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
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.all(10),
    //       child: Expanded(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Row(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Container(
    //                   width: 52,
    //                   height: 52,
    //                   decoration: ShapeDecoration(
    //                     color: Colors.white,
    //                     shape: RoundedRectangleBorder(
    //                       side: const BorderSide(
    //                           width: 1, color: Color(0xFFE8E6EA)),
    //                       borderRadius: BorderRadius.circular(15),
    //                     ),
    //                   ),
    //                   child: IconButton(
    //                       onPressed: () {
    //                         _showExitConfirmationDialog(context);
    //                       },
    //                       icon: const Icon(Icons.arrow_back_ios)),
    //                 ),
    //                 const SizedBox(
    //                   width: 151,
    //                   child: Text(
    //                     'Discover',
    //                     textAlign: TextAlign.center,
    //                     style: TextStyle(
    //                       color: Colors.black,
    //                       fontSize: 24,
    //                       fontFamily: 'Sk-Modernist',
    //                       fontWeight: FontWeight.w700,
    //                       height: 0,
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   width: 52,
    //                   height: 52,
    //                   decoration: ShapeDecoration(
    //                     color: Colors.white,
    //                     shape: RoundedRectangleBorder(
    //                       side: const BorderSide(
    //                           width: 1, color: Color(0xFFE8E6EA)),
    //                       borderRadius: BorderRadius.circular(15),
    //                     ),
    //                   ),
    //                   child: IconButton(
    //                       onPressed: () {
    //                         _showFilterOptions(context);
    //                       },
    //                       icon: const Icon(Icons.filter_list)),
    //                 )
    //               ],
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(bottom: 8.0),
    //               child: SizedBox(
    //                 width: 151,
    //                 child: Text(
    //                   textValues[current_page],
    //                   textAlign: TextAlign.center,
    //                   style: TextStyle(
    //                     color: Colors.black.withOpacity(0.699999988079071),
    //                     fontSize: 12,
    //                     fontFamily: 'Sk-Modernist',
    //                     fontWeight: FontWeight.w400,
    //                     height: 0,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 8.0,
    //             ),
    //             Expanded(
    //                 child: CardSwiper(
    //               numberOfCardsDisplayed: 3,
    //               isLoop: true,
    //               backCardOffset: const Offset(15, 40),
    //               cardBuilder: (context, index, x, y) {
    //                 return ClipRRect(
    //                   borderRadius: BorderRadius.circular(12),
    //                   child: Image.asset(
    //                     images[index],
    //                     fit: BoxFit.cover,
    //                     height: 150,
    //                   ),
    //                 );
    //               },
    //               cardsCount: 7,
    //               onSwipe: (previous, current, direction) {
    //                 if (direction == CardSwiperDirection.left) {
    //                   Fluttertoast.showToast(
    //                       msg: '😢',
    //                       backgroundColor: Colors.white,
    //                       fontSize: 28);
    //                 } else if (direction == CardSwiperDirection.right) {
    //                   Fluttertoast.showToast(
    //                       msg: '❤️', backgroundColor: Colors.red, fontSize: 28);
    //                 }
    //                 return true;
    //               },
    //             )),
    //             Padding(
    //               padding: const EdgeInsets.only(bottom: 15.0, top: 7),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.only(top: 10, bottom: 11),
    //                     child: Container(
    //                       width: 78,
    //                       height: 78,
    //                       decoration: const ShapeDecoration(
    //                         color: Colors.white,
    //                         shape: OvalBorder(),
    //                         shadows: [
    //                           BoxShadow(
    //                             color: Color(0x11000000),
    //                             blurRadius: 50,
    //                             offset: Offset(0, 20),
    //                             spreadRadius: 0,
    //                           )
    //                         ],
    //                       ),
    //                       child: IconButton(
    //                         onPressed: () {},
    //                         icon: CustomImageView(
    //                           color: Colors.red,
    //                           imagePath: ImageConstant.imgCloseYellow900,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   Container(
    //                     height: 99,
    //                     width: 99,
    //                     decoration: const ShapeDecoration(
    //                       color: Color(0xFFE94057),
    //                       shape: OvalBorder(),
    //                       shadows: [
    //                         BoxShadow(
    //                           color: Color(0x33E94057),
    //                           blurRadius: 15,
    //                           offset: Offset(0, 15),
    //                           spreadRadius: 0,
    //                         )
    //                       ],
    //                     ),
    //                     margin: const EdgeInsets.only(left: 20),
    //                     padding: const EdgeInsets.symmetric(
    //                         horizontal: 28, vertical: 30),
    //                     child: CustomImageView(
    //                         color: Colors.white,
    //                         imagePath: ImageConstant.imgContrastOnprimary,
    //                         height: 36,
    //                         width: 42,
    //                         alignment: Alignment.bottomCenter),
    //                   ),
    //                   const SizedBox(
    //                     width: 13,
    //                   ),
    //                   Container(
    //                       width: 78,
    //                       height: 78,
    //                       decoration: const ShapeDecoration(
    //                         color: Colors.white,
    //                         shape: OvalBorder(),
    //                         shadows: [
    //                           BoxShadow(
    //                             color: Color(0x11000000),
    //                             blurRadius: 50,
    //                             offset: Offset(0, 20),
    //                             spreadRadius: 0,
    //                           )
    //                         ],
    //                       ),
    //                       child: IconButton(
    //                           onPressed: () {
    //                             Navigator.push(
    //                                 context,
    //                                 MaterialPageRoute(
    //                                     builder: (builder) =>
    //                                         const ProfileScreen1()));
    //                           },
    //                           icon: CustomImageView(
    //                               color: const Color.fromRGBO(138, 35, 135, 1),
    //                               imagePath: ImageConstant.imgSignal,
    //                               height: 30,
    //                               width: 30,
    //                               alignment: Alignment.center))),
    //                 ],
    //               ),
    //             ),
    //             // Align(
    //             //         alignment: Alignment.bottomLeft,
    //             //         child: Text('Preminum Matches  (58)')),
    //             //         GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //             //   crossAxisCount: 3,
    //             //   crossAxisSpacing: 5.0,
    //             //   mainAxisSpacing: 5.0,
    //             // ),itemBuilder: (context, index) {
    //             //   return GridTile(child: Image.asset(image))
    //             // },)
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 226, 226),
      appBar: AppBar(
        actions: [
          Icon(CupertinoIcons.bell),
          SizedBox(
            width: 10,
          )
        ],
        title: Text('My Shaadi'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 160,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/img1.jpg'),
                      radius: 30,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Aswathy',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Icon(
                              Icons.verified,
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text('SHA2548654',
                              style: TextStyle(color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Text(
                              '|',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                  color: Colors.blue[400],
                                ),
                              ))
                        ],
                      ),
                      Text('Account type - Free',
                          style: TextStyle(color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.capslock_fill,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Upgrade Now',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blue[400],
                              borderRadius: BorderRadius.circular(20)),
                          height: 36,
                          width: 140,
                        ),
                      )
                    ],
                  )
                ],
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 48, 94, 132),
                    Color.fromARGB(255, 41, 107, 42)
                  ], // Gradient colors
                  begin: Alignment.topLeft, // Gradient start point
                  end: Alignment.bottomRight, // Gradient end point
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Image.asset('assets/images/shaadicom-banner-mobile.jpg'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 16, bottom: 16, top: 19),
                      child: Text(
                          '''A first of its king online event where you can have Video call with up to matches for 5 minutes each
                        '''),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tell me more',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.circular(20)),
                        height: 36,
                        width: 140,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/5a5a6d3714d8c4188e0b0890.png',
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text('Download your Biodata'),
                      Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Download',
                            style: TextStyle(color: Colors.green[300]),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 11, left: 11, right: 11, bottom: 8),
                child: Text(
                  'Complete Your Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.image_sharp),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Get 3 times more responses'),
                  Text(
                    'upload your photos',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.star_purple500),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Get Astro compatible Matches'),
                  Text(
                    'Add your Astro details',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text('Premium Matches (68)'),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 190,
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.white,
                          // height: 195,
                          width: 145,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Image.asset(
                                  images[index],
                                  height: 110,
                                  width: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 23.0),
                                    child: Text(
                                      '23 yrs, 5\' 7"',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 23.0),
                                    child: Text(
                                      'Malayalam',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 23.0),
                                    child: Text(
                                      'Palakad,kerala',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text('New Matches (28)'),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 190,
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.white,
                          // height: 195,
                          width: 145,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Image.asset(
                                  images[index],
                                  height: 110,
                                  width: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 23.0),
                                    child: Text(
                                      '23 yrs, 5\' 7"',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 23.0),
                                    child: Text(
                                      'Malayalam',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 23.0),
                                    child: Text(
                                      'Palakad,kerala',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text('Options & Setting'),
                )),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 10, right: 10),
                    child: Icon(Icons.people),
                  ),
                  Text('Partner Preferences'),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 10, right: 10),
                    child: Icon(Icons.contacts_outlined),
                  ),
                  Text('Contact Filter'),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 10, right: 10),
                    child: Icon(Icons.settings),
                  ),
                  Text('Account settings'),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // onTapProfile(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.profileScreen);
  // }
}

//children: [
//                         Container(
//                           width: 98,
//                           height: 58,
//                           decoration: const ShapeDecoration(
//                             color: Color(0xFFE94057),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(15),
//                                 bottomLeft: Radius.circular(15),
//                               ),
//                             ),
//                           ),
//                           child: const SizedBox(
//                             width: 58,
//                             child: Center(
//                               child: Text(
//                                 'Girls',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                   fontFamily: 'Sk-Modernist',
//                                   fontWeight: FontWeight.w700,
//                                   height: 0.11,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],

// class MainScreenNav extends StatefulWidget {
//   const MainScreenNav({super.key});
//
//   @override
//   State<MainScreenNav> createState() => _MainScreenNavState();
// }
//
// class _MainScreenNavState extends State<MainScreenNav> {
//
//   // int currentIndex =0;
//   List images = [
//     'assets/images/img1.jpg',
//     'assets/images/img.jpg',
//     'assets/images/img3.jpg',
//     'assets/images/img4.jpg',
//     'assets/images/img5.jpg',
//     'assets/images/img6.jpg',
//     'assets/images/img7.jpg',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 10),
//         height: 650,
//         child: CardSwiper(
//           numberOfCardsDisplayed: 3,
//           cardsCount: 7,
//           cardBuilder: (context,index,x,y) {
//             return ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.asset(images[index],fit: BoxFit.cover,height:150,),
//             );
//           },
//           allowedSwipeDirection: const AllowedSwipeDirection.only(left: true,right: true),
//         ),
//       ),
//     );
//   }
// }
