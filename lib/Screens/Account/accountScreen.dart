// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/Account/editprofile.dart';
import 'package:mere_maahi_dummy/Screens/SplashScreen/splash_service.dart';
import 'package:mere_maahi_dummy/auth/sign_in/signIn_with_email.dart';

List? username = userId?.split('@');
bool swith = false;

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 236, 231),
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => SignInScreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (c) => EditProfile())),
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: const Color.fromARGB(255, 218, 29, 26)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/img4.jpg'),
                          radius: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${username?.first.toString().toUpperCase()}',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              userId!,
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('My Account',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold)),
                            Text(
                              'Make changes to your account',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.red[100],
                          child: Icon(Icons.person),
                        ),
                      ),
                      ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Saved Beneficiary',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold)),
                            Text(
                              'Manage you saved account',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.red[100],
                          child: Icon(Icons.person),
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
                      ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Package plan',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold)),
                            Text(
                              'Further secure your account for sefety',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.red[100],
                          child: Icon(Icons.shield),
                        ),
                      ),
                      ListTile(
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Log Out',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold)),
                            Text(
                              'Log out your account',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.red[100],
                          child: Icon(Icons.logout),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
            Container(
              height: 130,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      title: Text('Help & Support',
                          style: TextStyle(
                              fontSize: 17,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold)),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.red[100],
                        child: Icon(CupertinoIcons.bell),
                      ),
                    ),
                    ListTile(
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      title: Text('About App',
                          style: TextStyle(
                              fontSize: 17,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold)),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.red[100],
                        child: Icon(Icons.favorite_border),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
