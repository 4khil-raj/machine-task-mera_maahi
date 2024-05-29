import 'package:firebase_messaging/firebase_messaging.dart';

class FirebasePushNottifications {
  final firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNottifications() async {
    await firebaseMessaging.requestPermission();
    final fcmTocken = await firebaseMessaging.getToken();
    print('this is tockes====================');
    print(fcmTocken);
    print('tocken==================');
    FirebaseMessaging.onBackgroundMessage(handlebackgroundfn);
  }

  Future<void> handlebackgroundfn(RemoteMessage message) async {
    print(message.notification?.title);
    print(message.notification?.body);
  }
}
