import 'package:flutter/material.dart';

class ListtileBasicDetails extends StatelessWidget {
  const ListtileBasicDetails(
      {super.key,
      required this.text1,
      required this.text2,
      required this.icon,
      required this.color,
      required this.lock});
  final bool lock;
  final String text1;
  final String text2;
  final Icon icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: icon,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: TextStyle(
                  fontSize: 13, color: Color.fromARGB(255, 107, 106, 106)),
            ),
            Row(
              children: [
                Text(text2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  width: 5,
                ),
                lock ? Icon(Icons.lock) : SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}
