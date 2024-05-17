import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile(
      {super.key,
      required this.onTap,
      required this.text,
      required this.profile});
  final String profile;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    print(text);
    return GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(profile),
          ),
          title: Text(text),
        ));
  }
}
