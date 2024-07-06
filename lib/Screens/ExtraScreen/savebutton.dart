import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mere_maahi_dummy/Firebase/currentuser_repo.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/Religion/religionScreen.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/aboutyou.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/addphotos.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/eductation.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/job_status.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/relationship.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/select_contry.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/thisProfileScreen.dart';
import 'package:mere_maahi_dummy/Screens/Passions/PassionchipViewItem.dart';

Future<void> saveProfile() async {
  var obj = {
    'this Profile for': selectedLabel1,
    'religion': selectedReligion,
    'community': selectedCommunity,
    'relationship': relationShip,
    'location': '$country,$state,$city',
    'education':
        '${graduateController.text},${univercityController.text},${stateController.text}',
    'working': areyouworking,
    'jobtitle': jobtitleController.text,
    'companyname': companynameController.text,
    'where is your company': whereisController.text,
    'about you': aboutyouController.text,
    'image1': image1,
    'image2': image2,
    'image3': image3,
    'image4': image4,
    'passion': Selectedpassionlables
  };
  print(obj);
  if (jobtitleController.text.isEmpty) {
    FirebaseFirestore.instance
        .collection('Profile')
        .doc(userAllDetails?.uid)
        .set({
      'this Profile for': selectedLabel1,
      'religion': selectedReligion,
      'community': selectedCommunity,
      'relationship': relationShip,
      'location': '$country,$state,$city',
      'education':
          '${graduateController.text},${univercityController.text},${stateController.text}',
      'working': areyouworking,
      'about you': aboutyouController.text,
      'image1': image1,
      'image2': image2,
      'image3': image3,
      'image4': image4,
      'passion': Selectedpassionlables
    });
  } else {
    FirebaseFirestore.instance
        .collection('Profile')
        .doc(userAllDetails?.uid)
        .set(obj);
  }
}
