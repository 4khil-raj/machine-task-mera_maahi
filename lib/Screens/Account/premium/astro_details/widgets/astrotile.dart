// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/Account/premium/astro_details/edit_astro.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/push.dart';

class AstroTile extends StatelessWidget {
  const AstroTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text('Astro Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
        InkWell(
          onTap: () => customNavPush(context, EditAstroScreen()),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                leading: Text(
                  'Visible to all members',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
