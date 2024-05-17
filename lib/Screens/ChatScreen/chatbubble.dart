import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble(
      {required this.message, required this.isCurrentUser, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isCurrentUser ? Colors.green : Colors.grey,
      ),
      child: Text(message),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 25),
    );
  }
}
