import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mere_maahi_dummy/Firebase/userfech_model.dart';

UserFetchModel? userAllDetails;

class CurrentUserRepo {
  Future<void> fetchuserdatas() async {
    // userAllDetails = null;

    try {
      User? user;
      user = FirebaseAuth.instance.currentUser;
      final data = await FirebaseFirestore.instance
          .collection('userDetails')
          .doc(user?.uid)
          .get();
      final theUser = data.data();
      userAllDetails = UserFetchModel(
          dob: theUser!['dob'],
          email: theUser['email'],
          gender: theUser['gender'],
          name: theUser['username'],
          profilePic: theUser['userProfile']);
    } catch (e) {
      log('Error fetching user data: $e');
    }
  }
}
