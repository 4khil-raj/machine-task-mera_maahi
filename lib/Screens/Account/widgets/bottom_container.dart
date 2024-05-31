// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/Account/about_us.dart';
import 'package:mere_maahi_dummy/Screens/Account/widgets/list_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomBottomContainerTile extends StatelessWidget {
  const CustomBottomContainerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Text(
                'More',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 130,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ProfileListTile(
                    textcolum: false,
                    function: () => _launchTCURL(),
                    headText: 'Help & Support',
                    icon: Icon(Icons.support_agent_outlined),
                    lowerText: '',
                  ),
                  ProfileListTile(
                    textcolum: false,
                    function: () => Navigator.push(
                        context, MaterialPageRoute(builder: (c) => AboutUs())),
                    headText: 'About App',
                    icon: Icon(Icons.favorite_border),
                    lowerText: '',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _launchTCURL() async {
    Uri url = Uri.parse(
        'https://www.freeprivacypolicy.com/live/4151c397-8eef-442a-95da-48c3275145b2');
    if (await launchUrl(url)) {
      //dialer opened
    } else {
      SnackBar(content: Text("couldn't launch the page"));
    }
  }
}
