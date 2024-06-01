// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mere_maahi_dummy/Screens/Account/premium/widgets/carouselslider.dart';
import 'package:mere_maahi_dummy/Screens/Account/premium/widgets/top_text.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class UpgradePremium extends StatelessWidget {
  const UpgradePremium({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topRight,
        colors: [
          Colors.white,
          const Color.fromARGB(255, 67, 159, 235),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Upgrade to Premium',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          PremiumTopText(),
          SizedBox(
            height: 50,
          ),
          CarouselPremiumPage(),
        ],
      ),
    );
  }
}
