import 'dart:io';

import 'package:flutter/material.dart';

Future<void> _showExitConfirmationDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Exit App'),
        content: const Text('Are you sure you want to exit the application?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Dismiss the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.of(context).pop(true); // Dismiss the dialog
            },
            child: const Text('Exit'),
          ),
        ],
      );
    },
  ).then((value) {
    if (value != null && value) {
      _exitApp();
    }
  });
}

void _exitApp() {
  exit(0);
}
