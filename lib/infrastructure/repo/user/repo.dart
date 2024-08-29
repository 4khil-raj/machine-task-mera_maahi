import 'package:http/http.dart' as http;
import 'package:mere_maahi_dummy/Firebase/userfech_model.dart';
import 'package:mere_maahi_dummy/api/apis.dart';
import 'package:mere_maahi_dummy/main.dart';

// class UserFetchRepo {
//   static userfetchReq() async {
//     final response = await http.get(
//       Uri.parse('${Apis.baseUrl}user'),
//       headers: {
//         'Authorization': 'Bearer $accesstocken',
//       },
//     );
//     print(response.body);
//   }
// }
import 'dart:convert';

import 'package:mere_maahi_dummy/model/userfetch.dart';

// Make sure this is the correct path to your API constants

class UserFetchRepo {
  static Future<UserFetchModel2?> userfetchReq() async {
    try {
      final response = await http.get(
        Uri.parse('${Apis.baseUrl}user'),
        headers: {
          'Authorization': 'Bearer $accesstocken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Parse the JSON response and convert it to a UserFetchModel instance
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        UserFetchModel2 user = UserFetchModel2.fromJson(responseData);
        return user;
      } else {
        // Handle error responses from the server
        print('Failed to fetch user data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle any errors that occur during the HTTP request
      print('Error fetching user data: $e');
      return null;
    }
  }
}
