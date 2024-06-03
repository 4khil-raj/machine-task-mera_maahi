import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Firebase/fechalldata.dart';
import 'package:mere_maahi_dummy/Screens/MatchesScreen/daily.dart';

class HomeScreenGridView extends StatelessWidget {
  const HomeScreenGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: details.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => Daily(
                                    appbar: true,
                                    about: details[index].about,
                                    email: details[index].email,
                                    image: details[index].profilePic,
                                    name: details[index].name,
                                  ))),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  details[index].profilePic!,
                                  // fit: BoxFit.fill,
                                ))),
                        // decoration: ,
                        // height: 150,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 9,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 243, 192, 41),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          '  ${details[index].name!.toUpperCase()}  ',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
