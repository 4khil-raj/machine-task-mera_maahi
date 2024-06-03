import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/Account/premium/astro_details/astro.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/push.dart';
import 'package:mere_maahi_dummy/Screens/partner_preferences/partner_preferences.dart';

class OptionsAndSetting extends StatelessWidget {
  const OptionsAndSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('Options & Setting'),
            )),
        InkWell(
          onTap: () => customNavPush(context, PartnerPreferences()),
          child: Container(
            color: Colors.white,
            child: const Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  child: Icon(Icons.people),
                ),
                Text('Partner Preferences'),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: const Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                child: Icon(Icons.contacts_outlined),
              ),
              Text('Contact Filter'),
              Spacer(),
              Icon(Icons.arrow_forward_ios),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
        InkWell(
          onTap: () => customNavPush(context, const AstroDetailScreen()),
          child: Container(
            color: Colors.white,
            child: const Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  child: Icon(Icons.settings),
                ),
                Text('Account settings'),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
