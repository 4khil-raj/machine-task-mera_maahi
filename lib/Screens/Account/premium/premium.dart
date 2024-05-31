import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class UpgradePremium extends StatelessWidget {
  const UpgradePremium({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topRight,
        colors: [
          Colors.white,
          Colors.red,
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
        children: [],
      ),
    );
  }
}
