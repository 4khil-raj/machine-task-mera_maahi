// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/button.dart';

class EditAstroScreen extends StatelessWidget {
  const EditAstroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Astro Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text('Astro Details',
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                Spacer(),
                customButton(
                  isRow: false,
                  borderclr: Colors.red,
                  height: 40,
                  name: 'Edit',
                  radius: 10,
                  textclr: Colors.black,
                  textsize: 15,
                  width: 70,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time of Birth',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text('8:00 AM',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                ],
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.red[300],
                child: Icon(
                  Icons.watch_later_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Place of Birth',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text('Other,Kerala,India',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                ],
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.red[300],
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mangalik?',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text('Don\'t Know',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                ],
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.red[300],
                child: Icon(
                  Icons.pie_chart_outline_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nakshthra',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text('Makham',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                ],
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.red[300],
                child: Icon(
                  Icons.star_border_purple500_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rashi',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text('Pisces(Meen)',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                ],
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.red[300],
                child: Icon(
                  Icons.border_all_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
