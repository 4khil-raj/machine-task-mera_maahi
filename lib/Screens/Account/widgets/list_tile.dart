import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile(
      {super.key,
      required this.function,
      required this.headText,
      required this.lowerText,
      required this.icon,
      required this.textcolum});
  final Function()? function;
  final bool textcolum;
  final String headText;
  final String lowerText;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: function,
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(headText,
              style: TextStyle(
                  fontSize: 17,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold)),
          textcolum
              ? Text(
                  lowerText,
                  style: TextStyle(fontSize: 12),
                )
              : SizedBox()
        ],
      ),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.red[100],
        child: icon,
      ),
    );
  }
}
