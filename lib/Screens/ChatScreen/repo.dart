import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/model.dart';
import 'package:mere_maahi_dummy/Screens/SplashScreen/splash_service.dart';

class ChatRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection('userDetails').snapshots().map((event) {
      return event.docs.map((e) {
        final user = e.data();
        return user;
      }).toList();
    });
  }

  Future<void> sendMessage(String receiverID, message) async {
    final Timestamp timestamp = Timestamp.now();
    MessageModel newMessage = MessageModel(
        senderID: userId!,
        senderEmail: userId!,
        receiverID: receiverID,
        message: message,
        timestamp: timestamp);
    List<String> ids = [userId!, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userID, otherUserId) {
    List<String> ids = [userID, otherUserId];
    ids.sort();
    String chatRoomID = ids.join('_');
    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
