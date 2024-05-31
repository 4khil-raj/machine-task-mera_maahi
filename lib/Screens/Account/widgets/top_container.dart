// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/Account/accountScreen.dart';
import 'package:mere_maahi_dummy/Screens/Account/premium/premium.dart';
import 'package:mere_maahi_dummy/Screens/Account/widgets/list_tile.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/push.dart';
import 'package:mere_maahi_dummy/userprofile/userprofile.dart';

class CustomTopContainerTiles extends StatefulWidget {
  const CustomTopContainerTiles({super.key});

  @override
  State<CustomTopContainerTiles> createState() => _CustomContainerTilesState();
}

class _CustomContainerTilesState extends State<CustomTopContainerTiles> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ProfileListTile(
                textcolum: true,
                function: () => customNavPush(context, UserProfile()),
                headText: 'My Account',
                icon: Icon(Icons.person),
                lowerText: 'Make changes to your account',
              ),
              ListTile(
                trailing: Switch(
                  activeColor: Colors.green,
                  value: swithNottification1,
                  onChanged: (value) {
                    setState(() {
                      swith = value;
                    });
                  },
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Notification',
                        style: TextStyle(
                            fontSize: 17,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold)),
                    Text(
                      'Manage App Notification',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.red[100],
                  child: Icon(CupertinoIcons.bell),
                ),
              ),
              ListTile(
                trailing: Switch(
                  activeColor: Colors.green,
                  value: swith,
                  onChanged: (value) {
                    setState(() {
                      swith = value;
                    });
                  },
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Face Id / Touch Id',
                        style: TextStyle(
                            fontSize: 17,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold)),
                    Text(
                      'Manage you Device Security',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.red[100],
                  child: Icon(Icons.lock_open_outlined),
                ),
              ),
              ProfileListTile(
                textcolum: true,
                function: () => customNavPush(context, UpgradePremium()),
                headText: 'Package Plan',
                icon: Icon(Icons.shield),
                lowerText: 'Further secure your account for sefety',
              ),
              ProfileListTile(
                textcolum: true,
                function: () => Show_DiloagBox(context),
                headText: 'Log Out',
                icon: Icon(Icons.logout),
                lowerText: 'Log out your account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
