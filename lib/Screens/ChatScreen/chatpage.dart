// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/chatbubble.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/repo.dart';
import 'package:mere_maahi_dummy/Screens/SplashScreen/splash_service.dart';
import 'package:mere_maahi_dummy/Screens/forgotPassword/widgets/form_field.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
  ChatPage({required this.receiverID, required this.receiverEmail, super.key});
  final messageController = TextEditingController();
  final ChatRepo chatRepo = ChatRepo();

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await chatRepo.sendMessage(receiverID, messageController.text);
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [Expanded(child: buildMessageList()), buildUserInput()],
      ),
    );
  }

  Widget buildMessageList() {
    return StreamBuilder(
      stream: ChatRepo().getMessages(receiverID, userId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => buildMessageItems(doc)).toList(),
        );
      },
    );
  }

  Widget buildMessageItems(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderId'] == userId;

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBubble(message: data['message'], isCurrentUser: isCurrentUser),
          ],
        ));
  }

  Widget buildUserInput() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              hintText: 'Type message',
              controller: messageController,
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
