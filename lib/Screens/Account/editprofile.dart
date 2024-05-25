// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, use_build_context_synchronously, prefer_final_fields, sort_child_properties_last, unnecessary_null_comparison

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mere_maahi_dummy/Firebase/currentuser_repo.dart';
import 'package:mere_maahi_dummy/Screens/Main/MainScreen.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/button.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/widgets/form_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final namecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();
  dynamic phonecontroller;
  final _formKey = GlobalKey<FormState>();
  String? _selectedValue;
  TextEditingController _dobController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked!.year > 2008) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('only 18+ peopels can join'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'))
            ],
          );
        },
      );
      return;
    }
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  bool loading = false;
  XFile? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bio-Data'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                              onTap: () async {
                                XFile? image = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                setState(() {
                                  selectedImage = image;
                                });
                              },
                              child: CircleAvatar(
                                backgroundImage: selectedImage != null
                                    ? FileImage(File('${selectedImage?.path}'))
                                    : null,
                                child: selectedImage == null
                                    ? Icon(
                                        Icons.person_2_outlined,
                                        size: 35,
                                      )
                                    : null,
                                backgroundColor: Colors.red[400],
                                radius: 50,
                              ))),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Mariya',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        'mariya@gmail.com',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              CustomTextFormField(
                  hintText: 'What is your name', controller: namecontroller),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                  hintText: 'And your last name',
                  controller: lastnamecontroller),
              SizedBox(
                height: 20,
              ),
              IntlPhoneField(
                decoration: const InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(),
                  ),
                  prefixIcon: Text('+'),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  setState(() {
                    phonecontroller = phone.completeNumber;
                  });
                },
              ),
              SizedBox(
                height: 4,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Select your Gender',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                value: _selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                },
                items: <String>[
                  'Male',
                  'Female',
                  'Other',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onTap: () => _selectDate(context),
                controller: _dobController,
                decoration: InputDecoration(
                  hintText: 'What is your Date of Birth?',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.calendar_month,
                      color: Colors.red[300],
                    ),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              loading
                  ? CircularProgressIndicator(
                      color: Colors.red,
                    )
                  : customButton(
                      isRow: false,
                      color: Colors.red[400],
                      height: 60,
                      width: 190,
                      name: 'Update Profile',
                      radius: 20,
                      textclr: Colors.white,
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        if (selectedImage != null &&
                            namecontroller.text.isNotEmpty &&
                            _dobController.text.isNotEmpty &&
                            _selectedValue != null) {
                          await updataProfile();
                          await CurrentUserRepo().fetchuserdatas();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Bio data added successfully'),
                          ));

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (c) => MainScreen()),
                              (route) => false);
                        } else {
                          setState(() {
                            loading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('fill all Details'),
                          ));
                        }
                      },
                      textsize: 16,
                      borderclr: Colors.red[500],
                    )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updataProfile() async {
    final image = await uploadPhoto(selectedImage?.path);
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('userDetails').doc(user?.uid).update({
      'userProfile': image,
      'username': namecontroller.text + lastnamecontroller.text,
      "dob": _dobController.text,
      'gender': _selectedValue,
      // 'phonenum': phonecontroller,
    });
  }
}

Future<String> uploadPhoto(photo) async {
  firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
      .ref('${DateTime.now().millisecondsSinceEpoch.toString()}');
  firebase_storage.UploadTask uploadTask = ref.putFile(File(photo));
  await uploadTask;
  var newUrl = await ref.getDownloadURL();
  return newUrl;
}
