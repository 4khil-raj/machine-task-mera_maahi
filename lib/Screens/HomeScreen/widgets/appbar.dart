import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 11),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Column(
                children: [
                  const Text(''),
                  GradientText(
                    colors: const [
                      Color.fromARGB(255, 236, 20, 4),
                      Colors.black,
                    ],
                    'Mera Maahi  ',
                    style: GoogleFonts.poppins(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Positioned(
                  // right: 5.5,
                  right: 6.7,
                  top: 18.5,
                  child: Icon(
                    Icons.favorite,
                    size: 15,
                    color: Color.fromARGB(255, 255, 0, 0),
                  ))
            ]),
            // Icon(
            //   Icons.panorama_horizontal_select_sharp,
            //   color: Colors.transparent,
            // ),
            // Text('Mera Maahi',
            //     style: TextStyle(
            //         fontSize: 20, fontWeight: FontWeight.w500)),
            // Icon(CupertinoIcons.bell)
          ],
        ),
      ),
    );
  }
}
