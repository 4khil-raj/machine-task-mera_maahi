import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Firebase/currentuser_repo.dart';
import 'package:mere_maahi_dummy/Firebase/fechalldata.dart';
import 'package:mere_maahi_dummy/Screens/MatchesScreen/daily.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/widgets/form_field.dart';

class Newmaches extends StatefulWidget {
  const Newmaches({super.key});

  @override
  State<Newmaches> createState() => _SearchMatchesState();
}

final searchController = TextEditingController();

List<String> photo = [
  'assets/images/img_photo_4.png',
  'assets/images/img_photo_415x375.png'
];
// List<String> name = ['Alexa', 'Swagi'];
// List<String>

class _SearchMatchesState extends State<Newmaches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListView.builder(
            itemCount: details.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => Daily(
                        email: details[index].email,
                        appbar: true,
                        image: details[index].profilePic,
                        name: details[index].name,
                        about: details[index].about,
                      ),
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Stack(children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Image(
                              image: NetworkImage(details[index].profilePic!)),
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
                                        details[index].name!,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
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
                                  const Text('21 yrs, 5\'2"  Not Working',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      )),
                                  const Text(
                                      'Malayalam, Ezhava  Idukki, Kerala',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
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
                                            color:
                                                Color.fromARGB(224, 0, 255, 17),
                                          ),
                                          label: const Text(
                                            "12h ago",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
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
                                            color:
                                                Color.fromARGB(223, 255, 0, 0),
                                          ),
                                          label: const Text(
                                            "You & Her",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
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
                                          backgroundColor:
                                              MaterialStateProperty.all(
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
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      )),
                                  TextButton.icon(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                        Colors.black38,
                                      )),
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.camera_alt_rounded,
                                        size: 20,
                                        color:
                                            Color.fromARGB(223, 255, 255, 255),
                                      ),
                                      label: const Text(
                                        "1",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      )),
                                  TextButton.icon(
                                    label: Text(''),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
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
                  ],
                ),
              );
            }),
      ),
    );
  }
}
