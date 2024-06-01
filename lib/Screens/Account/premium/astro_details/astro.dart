// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/Account/premium/astro_details/widgets/astrotile.dart';
import 'package:mere_maahi_dummy/Screens/Account/premium/astro_details/widgets/contact.dart';
import 'package:mere_maahi_dummy/Screens/Account/premium/astro_details/widgets/dob.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/button.dart';

class AstroDetailScreen extends StatelessWidget {
  const AstroDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 228, 228),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
        backgroundColor: Color.fromARGB(255, 251, 96, 85),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            ContactSettings(),
            SizedBox(
              height: 12,
            ),
            AstroTile(),
            SizedBox(
              height: 12,
            ),
            DateofBirthSetting(),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(17),
              child: customButton(
                isRow: false,
                borderclr: Colors.red,
                color: Colors.transparent,
                height: 50,
                name: 'Log Out',
                radius: 10,
                textclr: Colors.black,
                textsize: 15,
                width: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
