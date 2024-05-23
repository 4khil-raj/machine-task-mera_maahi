// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Firebase/currentuser_repo.dart';

class Daily extends StatefulWidget {
  const Daily({super.key});

  @override
  State<Daily> createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Center(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 35,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blue, Colors.green])),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Connect Now',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Stack(children: [
                Container(
                  // height: 400,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image(
                      image: NetworkImage(userAllDetails?.profilePic ??
                          'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png')),
                ),
                Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${userAllDetails?.name}',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.verified,
                                color: Colors.blue[400],
                              )
                            ],
                          ),
                          SizedBox(
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
                          Row(
                            children: [
                              TextButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                    Colors.white24,
                                  )),
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.circle,
                                    size: 10,
                                    color: Color.fromARGB(224, 0, 255, 17),
                                  ),
                                  label: const Text(
                                    "12h ago",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              TextButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                    Colors.white24,
                                  )),
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.people,
                                    size: 20,
                                    color: Color.fromARGB(223, 255, 0, 0),
                                  ),
                                  label: const Text(
                                    "You & Her",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )),
                Positioned(
                    right: 15,
                    top: 20,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                Colors.black38,
                              )),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.star_border_rounded,
                                size: 20,
                                color: Color.fromARGB(223, 246, 255, 0),
                              ),
                              label: const Text(
                                "Astro",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              )),
                          TextButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                Colors.black38,
                              )),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.camera_alt_rounded,
                                size: 20,
                                color: Color.fromARGB(223, 255, 255, 255),
                              ),
                              label: const Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              )),
                          TextButton.icon(
                            label: Text(''),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                              Colors.black38,
                            )),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz_outlined,
                              size: 30,
                              color: Color.fromARGB(223, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Text(
                            'About Chithra',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 13, right: 13, bottom: 13),
                      child: Text(
                        'Thank you for shoing interrest in my profile. Here are a few things about me. In terms of eduction m i have acquied my Bchelors in Law. Modern yet traditional,I am deeply inclined in our values, ethics ',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('View More'),
                        Icon(Icons.keyboard_arrow_down_sharp)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
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
