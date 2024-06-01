// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/button.dart';

class PlatinumPremium extends StatelessWidget {
  const PlatinumPremium({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 14, bottom: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Platinum',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '12 Months',
                    style: GoogleFonts.rubik(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Divider(),
            ),
            Text(
              '₹ 12,627',
              style: GoogleFonts.poppins(
                  fontSize: 33, fontWeight: FontWeight.w700),
            ),
            Text(
              '₹ 1,053 Per Month',
              style: GoogleFonts.poppins(
                  fontSize: 13, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.verified_sharp,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text(
                        'Send unlimited Messages',
                        style: TextStyle(
                            fontSize: 13.5,
                            color: Color.fromARGB(255, 71, 71, 71)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.verified_sharp,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text(
                        'View upto 600 contact numbers',
                        style: TextStyle(
                            fontSize: 13.5,
                            color: Color.fromARGB(255, 71, 71, 71)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.verified_sharp,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text(
                        'Standout from other profiles',
                        style: TextStyle(
                            fontSize: 13.5,
                            color: Color.fromARGB(255, 71, 71, 71)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.verified_sharp,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text(
                        'Let Matches contact you directly',
                        style: TextStyle(
                            fontSize: 13.5,
                            color: Color.fromARGB(255, 71, 71, 71)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: customButton(
                      isRow: false,
                      borderclr: Colors.red,
                      color: Color.fromARGB(255, 246, 94, 84),
                      height: 40,
                      name: 'Continue',
                      onTap: () {},
                      radius: 10,
                      textclr: Colors.black,
                      textsize: 15,
                      width: double.infinity,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
