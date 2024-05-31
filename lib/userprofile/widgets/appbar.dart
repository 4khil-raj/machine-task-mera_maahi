import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      // actions: [
      //   Stack(children: [
      //     TextButton(
      //       onPressed: () {},
      //       // icon: Icon(Icons.edit),
      //       child: const Text('Edit Profle',
      //           style: TextStyle(color: Colors.white)),
      //     ),
      //     const Positioned(
      //         left: -1,
      //         top: 17,
      //         child: Icon(
      //           Icons.edit,
      //           color: Colors.white,
      //           size: 14,
      //         ))
      //   ])
      // ],
      title: Text('Profile Preview',
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
      backgroundColor: Colors.red,
    );
  }
}
