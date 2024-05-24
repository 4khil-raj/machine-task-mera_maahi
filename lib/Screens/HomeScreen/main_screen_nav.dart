// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mere_maahi_dummy/Firebase/currentuser_repo.dart';
import 'package:mere_maahi_dummy/Firebase/fechalldata.dart';
import 'package:mere_maahi_dummy/Screens/SplashScreen/splash_service.dart';

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
    exit(0);
  }

  //

  //
  @override
  Widget build(BuildContext context) {
    userId = FirebaseAuth.instance.currentUser!.email;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 226, 226),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.panorama_horizontal_select_sharp,
                        color: Colors.transparent,
                      ),
                      Text('My Shaadi',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      Icon(CupertinoIcons.bell)
                    ],
                  ),
                ),
              ),
              Container(
                height: 160,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(userAllDetails!.profilePic!),
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
                                userAllDetails!.name!.toUpperCase(),
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
                            Text('SHA548A647b',
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
                  child:
                      Image.asset('assets/images/shaadicom-banner-mobile.jpg'),
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
              // Align(
              //     alignment: Alignment.topLeft,
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 8),
              //       child: Text('Premium Matches (68)'),
              //     )),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     height: 190,
              //     child: GridView.builder(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: images.length,
              //         gridDelegate:
              //             const SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 1,
              //           crossAxisSpacing: 1.0,
              //           mainAxisSpacing: 1.0,
              //         ),
              //         itemBuilder: (context, index) {
              //           return Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Container(
              //               color: Colors.white,
              //               // height: 195,
              //               width: 145,
              //               child: Column(
              //                 children: [
              //                   SizedBox(
              //                     height: 10,
              //                   ),
              //                   Container(
              //                     child: Image.asset(
              //                       images[index],
              //                       height: 110,
              //                       width: 140,
              //                       fit: BoxFit.cover,
              //                     ),
              //                   ),
              //                   Align(
              //                       alignment: Alignment.topLeft,
              //                       child: Padding(
              //                         padding:
              //                             const EdgeInsets.only(left: 23.0),
              //                         child: Text(
              //                           '23 yrs, 5\' 7"',
              //                           style: TextStyle(fontSize: 10),
              //                         ),
              //                       )),
              //                   Align(
              //                       alignment: Alignment.topLeft,
              //                       child: Padding(
              //                         padding:
              //                             const EdgeInsets.only(left: 23.0),
              //                         child: Text(
              //                           'Malayalam',
              //                           style: TextStyle(fontSize: 10),
              //                         ),
              //                       )),
              //                   Align(
              //                       alignment: Alignment.topLeft,
              //                       child: Padding(
              //                         padding:
              //                             const EdgeInsets.only(left: 23.0),
              //                         child: Text(
              //                           'Palakad,kerala',
              //                           style: TextStyle(fontSize: 10),
              //                         ),
              //                       ))
              //                 ],
              //               ),
              //             ),
              //           );
              //         }),
              //   ),
              // ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('New Matches (${details.length})'),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 200,
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: details.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1.0,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          details[index].profilePic!,
                                          // fit: BoxFit.fill,
                                        ))),
                                // decoration: ,
                                // height: 150,
                              ),
                              Positioned(
                                bottom: 10,
                                left: 9,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 243, 192, 41),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    '  ${details[index].name!.toUpperCase()}  ',
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 255, 0, 0),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                        // Padding(
                        //             padding: const EdgeInsets.all(8.0),
                        //             child: Container(
                        //               color: Colors.white,
                        //               // height: 195,
                        //               width: 145,
                        //               child: Column(
                        //                 children: [
                        //                   SizedBox(
                        //                     height: 10,
                        //                   ),
                        //                   Container(
                        //                       height: 150,
                        //                       child: Image.network(
                        //                         details[index].profilePic!,
                        //                         fit: BoxFit.cover,
                        //                       )),
                        //                   Align(
                        //                       alignment: Alignment.topLeft,
                        //                       child: Padding(
                        //                         padding:
                        //                             const EdgeInsets.only(left: 23.0),
                        //                         child: Text(
                        //                           // '23 yrs, 5\' 7"',
                        //                           details[index].name!,
                        //                           style: TextStyle(fontSize: 10),
                        //                         ),
                        //                       )),
                        //                   // Align(
                        //                   //     alignment: Alignment.topLeft,
                        //                   //     child: Padding(
                        //                   //       padding:
                        //                   //           const EdgeInsets.only(left: 23.0),
                        //                   //       child: Text(
                        //                   //         'Malayalam',
                        //                   //         style: TextStyle(fontSize: 10),
                        //                   //       ),
                        //                   //     )),
                        //                   // Align(
                        //                   //     alignment: Alignment.topLeft,
                        //                   //     child: Padding(
                        //                   //       padding:
                        //                   //           const EdgeInsets.only(left: 23.0),
                        //                   //       child: Text(
                        //                   //         'Palakad,kerala',
                        //                   //         style: TextStyle(fontSize: 10),
                        //                   //       ),
                        //                   //     ))
                        //                 ],
                        //               ),
                        //             ),
                        //           );
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
      ),
    );
  }
}
