import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mere_maahi_dummy/Firebase/userfech_model.dart';

List<UserFetchModel> details = [];

class FetchAlUsersDatas {
  Future<void> fetchdata() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('userDetails').get();
      for (var element in querySnapshot.docs) {
        final thedata = element.data();
        UserFetchModel model = UserFetchModel(
            about: thedata['about'],
            uid: thedata['uid'],
            dob: thedata['dob'],
            email: thedata['email'],
            gender: thedata['gender'],
            name: thedata['username'],
            profilePic: thedata['userProfile']);

        details.add(model);
      }
      // return details;
    } catch (e) {
      // return [];
    }
  }
}
