import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mere_maahi_dummy/Firebase/currentuser_repo.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/button.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _feedController = TextEditingController();

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    _nameController.text = userAllDetails!.name!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'About Us',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 110,
              ),
              // Text(
              //   "We Store",
              //   style: TextStyle(
              //     fontSize: 28,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              Text(
                '"Your Feedback is valueable to us"',
                style: GoogleFonts.poppins(
                    fontSize: 16.5, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                // validator: validateName,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _nameController,
                decoration: InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 17,
              ),
              TextFormField(
                // validator: validatefeedback,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _feedController,
                decoration: InputDecoration(
                    label: Text('Ente Your Feedback'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                maxLines: 5,
              ),
              SizedBox(
                height: 15,
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       setState(() {
              //         // addfeed();
              //         Navigator.pop(context);
              //       });
              //     },
              //     child: Text('Submit'))
              customButton(
                isRow: false,
                borderclr: Colors.red,
                color: Colors.red,
                height: 40,
                name: 'Submit',
                onTap: () {
                  if (_nameController.text.isNotEmpty &&
                      _feedController.text.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Your Feedback Recoreded')));
                    aboutus();
                    _feedController.clear();
                    Navigator.pop(context);
                  }
                },
                radius: 20,
                textclr: Colors.white,
                textsize: 16,
                width: 150,
              )
            ],
          ),
        ),
      ),
    );
  }

  void aboutus() async {
    await FirebaseFirestore.instance.collection('about_us').doc().set({
      'name': _nameController.text,
      'email': userAllDetails?.email,
      'feedback': _feedController.text
    });
  }
}
