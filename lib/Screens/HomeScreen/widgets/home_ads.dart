// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Firebase/fechalldata.dart';

class HomeScreenAds extends StatelessWidget {
  const HomeScreenAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Image.asset('assets/images/meramaahicover.jpg'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10, left: 10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 16, bottom: 16, top: 19),
                  child: Text(
                      '''A first of its king online event where you can have Video call with up to matches for 5 minutes each
                        '''),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(20)),
                    height: 36,
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Tell me more',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/5a5a6d3714d8c4188e0b0890.png',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text('Download your Biodata'),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Download',
                        style: TextStyle(color: Colors.green[300]),
                      ))
                ],
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text('New Matches (${details.length})'),
            )),
      ],
    );
  }
}
