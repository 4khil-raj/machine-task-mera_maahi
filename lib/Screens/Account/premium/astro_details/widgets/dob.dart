// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class DateofBirthSetting extends StatelessWidget {
  const DateofBirthSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text('Date of Birth',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Text(
                'Show Full Date of Birth(dd/mm/yyyy)',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ),
      ],
    );
  }
}
