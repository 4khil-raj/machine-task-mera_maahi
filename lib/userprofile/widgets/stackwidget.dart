// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class UserImageStack extends StatelessWidget {
  const UserImageStack(
      {super.key, this.name, this.image, this.email, this.about});
  final String? name;
  final String? image;
  final String? email;
  final String? about;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Stack(children: [
        Container(
          height: 450,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                image ??
                    // details.first.profilePic ??
                    'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png',
              )),
        ),
        Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name ?? 'username',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.verified,
                      color: Colors.blue[400],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text('21 yrs, 5\'2"  Not Working',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
                Text('Malayalam, Ezhava  Idukki, Kerala',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
              ],
            )),
      ]),
    );
  }
}

class TextContainerProfile extends StatelessWidget {
  const TextContainerProfile({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.red),
          color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Text(text),
      ),
    );
  }
}
