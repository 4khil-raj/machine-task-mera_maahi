// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mere_maahi_dummy/userprofile/widgets/common.dart';
import 'package:mere_maahi_dummy/userprofile/widgets/stackwidget.dart';

class BasicDetailsProfle extends StatelessWidget {
  const BasicDetailsProfle({super.key});
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
                padding: EdgeInsets.all(8.0),
                child: Text('Basic Details',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  TextContainerProfile(
                    text: 'Created by Self',
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  TextContainerProfile(
                    text: 'ID: SH12937802',
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  TextContainerProfile(
                    text: '22 yrs old',
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  TextContainerProfile(
                    text: 'Height - 5\'9',
                  ),
                ],
              ),
              SizedBox(
                height: 11,
              ),
              ListtileBasicDetails(
                lock: true,
                color: Colors.red,
                icon: Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
                text1: 'Birth Date',
                text2: 'Born on **/**/****',
              ),
              ListtileBasicDetails(
                lock: false,
                color: Colors.red,
                icon: Icon(Icons.person, color: Colors.white),
                text1: 'Marital Status',
                text2: 'Never Married',
              ),
              ListtileBasicDetails(
                lock: false,
                color: Colors.red,
                icon: Icon(Icons.location_on, color: Colors.white),
                text1: 'Lives in',
                text2: 'Lives in Kerala,india',
              ),
              ListtileBasicDetails(
                lock: false,
                color: Colors.red,
                icon: Icon(Icons.book, color: Colors.white),
                text1: 'Religion & Mother Tongue',
                text2: 'Hindu, Malayalam',
              ),
              ListtileBasicDetails(
                lock: false,
                color: Colors.red,
                icon: Icon(Icons.people, color: Colors.white),
                text1: 'Community',
                text2: 'Ezhava',
              ),
              ListtileBasicDetails(
                lock: false,
                color: Colors.red,
                icon: Icon(Icons.fastfood_sharp, color: Colors.white),
                text1: 'Diet Preferance',
                text2: 'Non-Vegeterian',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
