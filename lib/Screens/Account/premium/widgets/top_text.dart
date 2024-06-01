import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PremiumTopText extends StatelessWidget {
  const PremiumTopText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select',
              style: GoogleFonts.playfair(
                  fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            Stack(children: [
              GradientText(
                colors: const [
                  Color.fromARGB(255, 192, 14, 1),
                  Colors.black,
                ],
                'Mera Maahi  ',
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Positioned(
                  // right: 5.5,
                  right: 8.5,
                  top: -0.9,
                  child: Icon(
                    Icons.favorite_rounded,
                    size: 18,
                    color: Colors.black,
                  ))
            ])
          ],
        ),
        Text(
          'Experience Personalised Matchmaking',
          style: GoogleFonts.poppins(fontSize: 13.5),
        ),
      ],
    );
  }
}
