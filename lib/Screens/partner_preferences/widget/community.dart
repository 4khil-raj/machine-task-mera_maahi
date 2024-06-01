// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mere_maahi_dummy/userprofile/widgets/common.dart';

class CommunityPartnerPreferance extends StatelessWidget {
  const CommunityPartnerPreferance({super.key});

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
                child: Text('Community',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 8),
              const ListtileBasicDetails(
                lock: false,
                color: Colors.red,
                icon: Icon(Icons.book, color: Colors.white),
                text1: 'Religion',
                text2: 'Hindu',
              ),
              ListtileBasicDetails(
                lock: false,
                color: Colors.red,
                icon: Icon(Icons.group, color: Colors.white),
                text1: 'Community',
                text2: 'Open to all',
              ),
              ListtileBasicDetails(
                lock: false,
                color: Colors.red,
                icon: Icon(Icons.language, color: Colors.white),
                text1: 'Mother Tongue',
                text2: 'Malayalam',
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
