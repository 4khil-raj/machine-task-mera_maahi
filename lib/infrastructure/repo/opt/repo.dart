import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mere_maahi_dummy/Screens/Account/accountScreen.dart';
import 'package:mere_maahi_dummy/Screens/Main/MainScreen.dart';
import 'package:mere_maahi_dummy/api/apis.dart';

class OtpRepos {
  static Future<void> otpVerify(
      String email, String otp, BuildContext context) async {
    final Map<String, String> req = {"email": email, "otp": otp};
    print(req);

    try {
      final response = await http.post(
        Uri.parse('${Apis.baseUrl}auth/verify'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(req),
      );
      print(response.body);

      if (response.statusCode == 200) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
          (route) => false,
        );
      } else {
        // Parse and display the error message from the response
        final responseBody = jsonDecode(response.body);
        String errorMessage = responseBody['message'] ?? 'Something went wrong';
        _showAlert(context, errorMessage);
      }
    } catch (e) {
      print(e);
      _showAlert(context, 'An error occurred. Please try again.');
    }
  }

  static void _showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
