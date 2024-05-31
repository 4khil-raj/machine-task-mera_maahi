// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mere_maahi_dummy/userprofile/widgets/common.dart';

class ContactDetailsProfile extends StatelessWidget {
  const ContactDetailsProfile({super.key});

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
                padding: EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Contact Details',
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Icon(
                      CupertinoIcons.capslock_fill,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              SizedBox(height: 8),
              ListtileBasicDetails(
                lock: true,
                color: Colors.red,
                icon: Icon(Icons.phone, color: Colors.white),
                text1: 'Contact No.',
                text2: '+91 8943********',
              ),
              ListtileBasicDetails(
                lock: true,
                color: Colors.red,
                icon: Icon(Icons.email, color: Colors.white),
                text1: 'Email Id',
                text2: '*************@gmail.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
