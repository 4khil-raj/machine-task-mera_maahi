// import 'dart:convert';

// import 'package:mere_maahi_dummy/api/apis.dart';
// import 'package:mere_maahi_dummy/infrastructure/repo/register/repo.dart';

// import 'package:http/http.dart' as http;

// class SignUpRepo {
//   static Future signUprepo(UserRegisterRepo model) async {
//     Map req = {
//       "first_name": model.firstName,
//       "last_name": model.lastName,
//       "email": model.email,
//       "phone": model.phone,
//       "gender": model.gender,
//       "dob": model.dob,
//       "profile_for": model.profileFor,
//       "relationship_status": model.relationshipStatus,
//       "images": model.images,
//       "interests": model.interests,
//       "job": {
//         "title": model.job.title,
//         "company": model.job.company,
//         "place": model.job.place
//       },
//       "education": {
//         "qualification": model.education.qualification,
//         "university": model.education.university,
//         "place": model.education.place
//       },
//       "password": model.password,
//       "country": model.country,
//       "state": model.state,
//       "city": model.city,
//       "latitude": model.latitude,
//       "longitude": model.longitude,
//       "religion": model.religion,
//       "caste": model.caste
//     };
//     print('${Apis.baseUrl}auth/register');
//     try {
//       final response = await http.post(
//           Uri.parse('${Apis.baseUrl}auth/register'),
//           body: jsonEncode(req));
//       print(jsonDecode(response.body));
//     } catch (e) {
//       print(e);
//     }
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:mere_maahi_dummy/Screens/ChatScreen/push.dart';
import 'package:mere_maahi_dummy/api/apis.dart';
import 'package:mere_maahi_dummy/auth/SignInScreens/PhoneNumber/OtpScreen.dart';
import 'package:mere_maahi_dummy/infrastructure/repo/register/repo.dart';

class SignUpRepo {
  static Future signUprepo(UserRegisterRepo model, context) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${Apis.baseUrl}auth/register'),
    );

    // Add fields to the request
    request.fields['first_name'] = model.firstName;
    request.fields['last_name'] = model.lastName;
    request.fields['email'] = model.email;
    request.fields['phone'] = model.phone;
    request.fields['gender'] = model.gender;
    request.fields['dob'] = model.dob;
    request.fields['profile_for'] = model.profileFor;
    request.fields['relationship_status'] = model.relationshipStatus;
    request.fields['password'] = model.password;
    request.fields['country'] = model.country;
    request.fields['state'] = model.state;
    request.fields['city'] = model.city;
    request.fields['latitude'] = model.latitude.toString();
    request.fields['longitude'] = model.longitude.toString();
    request.fields['religion'] = model.religion;
    request.fields['caste'] = model.caste;

    // Add job fields
    request.fields['job[title]'] = model.job.title;
    request.fields['job[company]'] = model.job.company;
    request.fields['job[place]'] = model.job.place;

    // Add education fields
    request.fields['education[qualification]'] = model.education.qualification;
    request.fields['education[university]'] = model.education.university;
    request.fields['education[place]'] = model.education.place;

    // Add interests as a JSON string if it's a list
    if (model.interests != null) {
      request.fields['interests'] = jsonEncode(model.interests);
    }

    // Add images as files
    for (String imagePath in model.images) {
      File imageFile = File(imagePath);
      request.files
          .add(await http.MultipartFile.fromPath('images', imageFile.path));
    }
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: model.email, password: model.password);

    try {
      // Send the request
      final response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        print(jsonDecode(responseBody));
        customNavPush(
            context,
            OtpScreen(
              email: model.email,
            ));
      } else {
        print('Failed to register. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
