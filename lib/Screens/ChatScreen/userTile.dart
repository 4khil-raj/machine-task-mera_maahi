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
        child: Column(
          children: [
            // Divider(),
            SizedBox(
              height: 5,
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(profile),
              ),
              title: Text(
                text.toUpperCase(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Divider()
          ],
        ));
  }
}
