// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mere_maahi_dummy/userprofile/widgets/common.dart';

class EducationDetalsProfile extends StatelessWidget {
  const EducationDetalsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text('Career & Education',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 8),
              const ListtileBasicDetails(
                lock: false,
                color: Colors.red,
                icon: Icon(Icons.work, color: Colors.white),
                text1: 'Profession',
                text2: 'Software Developer ',
              ),
              ListtileBasicDetails(
                lock: true,
                color: Colors.red,
                icon: Icon(Icons.maps_home_work_rounded, color: Colors.white),
                text1: 'Comapany Name',
                text2: '*************',
              ),
              ListtileBasicDetails(
                lock: false,
                color: Colors.red,
                icon: Icon(Icons.wallet, color: Colors.white),
                text1: 'Annual Income',
                text2: 'Earns INR 1 crore',
              ),
              ListtileBasicDetails(
                lock: false,
                color: Colors.red,
                icon: Icon(Icons.school, color: Colors.white),
                text1: 'Highest Qualification',
                text2: 'Engineering-Diploma',
              ),
              ListtileBasicDetails(
                lock: false,
                color: Colors.red,
                icon: Icon(Icons.book, color: Colors.white),
                text1: 'Education Field',
                text2: 'Engineering',
              ),
              ListtileBasicDetails(
                lock: true,
                color: Colors.red,
                icon: Icon(Icons.assured_workload, color: Colors.white),
                text1: 'Collage Name',
                text2: '**********',
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
