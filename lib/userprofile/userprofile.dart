// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mere_maahi_dummy/userprofile/widgets/appbar.dart';
import 'package:mere_maahi_dummy/userprofile/widgets/about_user.dart';
import 'package:mere_maahi_dummy/userprofile/widgets/basic_details.dart';
import 'package:mere_maahi_dummy/userprofile/widgets/contact.dart';
import 'package:mere_maahi_dummy/userprofile/widgets/education.dart';
import 'package:mere_maahi_dummy/userprofile/widgets/stackwidget.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 221, 221),
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 55), child: ProfileAppbar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserImageStack(
              image:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8TYf-iIarICWF-UOPWlmB6rhB-Ag1YYXEEQ&s',
            ),
            AboutUserProfile(),
            BasicDetailsProfle(),
            ContactDetailsProfile(),
            EducationDetalsProfile()
          ],
        ),
      ),
    );
  }
}
