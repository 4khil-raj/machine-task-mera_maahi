// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mere_maahi_dummy/Firebase/fechalldata.dart';
import 'package:mere_maahi_dummy/Screens/MatchesScreen/daily.dart';
import 'package:mere_maahi_dummy/Screens/MatchesScreen/search.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 235, 228, 228),
        body: DefaultTabController(
          initialIndex: 1,
          length: 2,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 50,
                  child: TabBar(
                    unselectedLabelColor:
                        const Color.fromARGB(255, 119, 115, 115),
                    isScrollable: true,
                    tabs: [
                      // Row(
                      //   children: [
                      //     Icon(Icons.search),
                      //     Text(
                      //       'Search',
                      //       style: TextStyle(fontSize: 18),
                      //     ),
                      //   ],
                      // ),
                      Text('New (${details.length})',
                          style: TextStyle(fontSize: 18)),
                      Text('Daily (1)', style: TextStyle(fontSize: 18)),
                      // Text('My matches (652)', style: TextStyle(fontSize: 18)),
                      // Row(
                      //   children: [
                      //     Icon(Icons.location_on_outlined),
                      //     Text('Near Me (245)',
                      //         style: TextStyle(fontSize: 18)),
                      //   ],
                      // ),
                      // Text('More Matches', style: TextStyle(fontSize: 18)),
                      // Text('ShortListed', style: TextStyle(fontSize: 18)),
                      // Text('Recently Viewed', style: TextStyle(fontSize: 18))
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(children: [
                Newmaches(),
                Daily(
                  appbar: false,
                ),
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
