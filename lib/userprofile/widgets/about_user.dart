// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Firebase/fechalldata.dart';

class AboutUserProfile extends StatelessWidget {
  const AboutUserProfile(
      {super.key, this.name, this.image, this.email, this.about});
  final String? name;
  final String? image;
  final String? email;
  final String? about;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(13),
                  child: Row(
                    children: [
                      Text('About  ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      Text(
                        name ?? '${details.first.name?.toUpperCase()}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 13, right: 13, bottom: 13),
              child: Text(
                about ?? '${details.first.about}',
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text('View More'),
            //     Icon(Icons.keyboard_arrow_down_sharp)
            //   ],
            // ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
