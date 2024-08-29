import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/Main/MainScreen.dart';
import 'package:mere_maahi_dummy/api/apis.dart';
import 'package:mere_maahi_dummy/main.dart';

class LoginRepo {
  static loginReq(String email, String password, context) async {
    Map req = {'email': email, 'password': password};

    try {
      final response = await http.post(
        Uri.parse('${Apis.baseUrl}auth/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(req),
      );

      final responseBody = await jsonDecode(response.body);
      if (response.statusCode == 200) {
        saveinfo(responseBody['accessToken']);
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
