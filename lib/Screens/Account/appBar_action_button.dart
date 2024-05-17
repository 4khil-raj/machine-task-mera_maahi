import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Const/theme.dart';
import 'package:mere_maahi_dummy/Screens/HomeScreen/main_screen_nav.dart';
import 'package:mere_maahi_dummy/Screens/Main/MainScreen.dart';
import 'package:mere_maahi_dummy/Screens/OnboardingScreen/onboardingScreen.dart';

import '../../Const/Style.dart';

class AppBarActionButton extends StatefulWidget {
  const AppBarActionButton({super.key});

  @override
  State<AppBarActionButton> createState() => _AppBarActionButtonState();
}

class _AppBarActionButtonState extends State<AppBarActionButton> {
  final userIDController = TextEditingController();
  final groupNameController = TextEditingController();
  final groupUsersController = TextEditingController();
  final groupIDController = TextEditingController();

  void show_DialogBox() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Are you sure?"),
            content: const Text('Are sure you want to exit'),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No')),
              TextButton(
                onPressed: () {
                  //this is Use when exit from the application
                  exit(0);
                },
                style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge),
                child: const Text('Yes'),
              )
            ],
          );
        });
  }

  //this DialogBox for Sign out

  void Show_DiloagBox() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Are you sure ?'),
            content: const Text('Are sure you want to log out'),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelMedium),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();

                    //After SignOut we easily Navigate to LoginScreen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const OnboardingThreeScreen()));
                  },
                  child: const Text('Yes')),
              TextButton(
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelMedium),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No'))
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        position: PopupMenuPosition.under,
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
                value: 'One',
                child: ListTile(
                  leading: Icon(CupertinoIcons.chat_bubble_2_fill),
                  title: Text(
                    'One',
                    maxLines: 1,
                  ),
                  // onTap: () => ZIMKit().showDefaultNewPeerChatDialog(context),
                )),
            const PopupMenuItem(
                value: 'Terms',
                child: ListTile(
                  leading: Icon(CupertinoIcons.person_2_fill),
                  title: Text(
                    'Privacy',
                    maxLines: 1,
                  ),
                  // onTap: () => ZIMKit().showDefaultNewGroupChatDialog(context),
                )),
            PopupMenuItem(
                value: 'Join',
                child: ListTile(
                  leading: Icon(Icons.group_add),
                  title: Text(
                    'Join Group',
                    maxLines: 1,
                  ),
                  // onTap: () {
                  //   Navigator.push(context, MaterialPageRoute(builder: (builder)=> MainScreenNav()));
                  // },
                )),
            PopupMenuItem(
                child: TextButton.icon(
              onPressed: () {
                Show_DiloagBox();
              },
              icon: const Icon(Icons.logout,color:Colors.red,),
              label:  Text('Log Out',style:Styles.bold_app_accent_12),
            ))
          ];
        });
  }
}
