// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/application/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:mere_maahi_dummy/application/partner_pref/partner_pref_bloc.dart';
import 'package:mere_maahi_dummy/firebase_options.dart';
import 'package:mere_maahi_dummy/push_nottification/push_nottification.dart';
import 'package:mere_maahi_dummy/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // final _messageStreamController = BehaviorSubject<RemoteMessage>();
  // ZegoUIKit().initLog().then((value) {
  //   ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
  //     [ZegoUIKitSignalingPlugin()],
  //   );
  // });
  await PushNotification.init();

  await PushNotification.localNotiInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BottomNavBloc(),
          ),
          BlocProvider(
            create: (context) => PartnerPrefBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Mera Maahi_02',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          navigatorKey: navigatorKey,
          initialRoute: AppRoutes.splashScreen,
          routes: AppRoutes.routes,
          // home: const WorkingorNot(),
        ));
  }
}
