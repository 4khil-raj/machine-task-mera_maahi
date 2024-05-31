// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Firebase/currentuser_repo.dart';
import 'package:mere_maahi_dummy/Screens/Account/editprofile.dart';

class UserDetailsContainer extends StatelessWidget {
  const UserDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  backgroundImage: NetworkImage(userAllDetails!.profilePic!),
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
                      userAllDetails!.name!.toUpperCase(),
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      userAllDetails!.email!,
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
    );
  }
}
