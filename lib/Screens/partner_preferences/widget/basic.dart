// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mere_maahi_dummy/userprofile/widgets/common.dart';

class BasicPartnerPreferance extends StatelessWidget {
  const BasicPartnerPreferance({super.key});

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
                child: Text('Basic Details',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 8),
              const ListtileBasicDetails(
                lock: false,
                color: Colors.red,
                icon: Icon(Icons.calendar_month, color: Colors.white),
                text1: 'Age Range',
                text2: '18 to 21  ',
              ),
              ListtileBasicDetails(
                lock: false,
                color: Colors.red,
                icon: Icon(Icons.maps_home_work_rounded, color: Colors.white),
                text1: 'Height Range',
                text2: '5\'0" to 5\'9"',
              ),
              ListtileBasicDetails(
                lock: false,
                color: Colors.red,
                icon: Icon(Icons.people, color: Colors.white),
                text1: 'Marital Status',
                text2: 'Not Married',
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
