// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/button.dart';

class GoldContainer1 extends StatelessWidget {
  const GoldContainer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: const EdgeInsets.all(10),
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
                    'Gold',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '3 Months',
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
              '₹ 4,407',
              style: GoogleFonts.poppins(
                  fontSize: 33, fontWeight: FontWeight.w700),
            ),
            Text(
              '₹ 1,496 Per Month',
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
                        'View upto 75 contact numbers',
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
                        Icons.close,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Stack(
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Text(
                                'Standout from other profiles',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 94, 93, 93),
                                  fontSize: 13.5,
                                ),
                              );
                            },
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  height: 1,
                                  color: const Color.fromARGB(255, 94, 93, 93)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Stack(
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Text(
                                'Let Matches contact you directly',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 94, 93, 93),
                                  fontSize: 13.5,
                                ),
                              );
                            },
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                height: 1,
                                color: const Color.fromARGB(255, 94, 93, 93),
                              ),
                            ),
                          ),
                        ],
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
