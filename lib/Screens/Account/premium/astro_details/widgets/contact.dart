// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ContactSettings extends StatelessWidget {
  const ContactSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Contact Privacy',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '+91-8943514279',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text('Only Premium Members',
                      style: TextStyle(
                        fontSize: 12,
                      ))
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'akhilraj20801@gmail.com',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text('Edit Your email',
                      style: TextStyle(
                        fontSize: 12,
                      ))
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        )
      ],
    );
  }
}
