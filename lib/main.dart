// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/Main/MainScreen.dart';
import 'package:mere_maahi_dummy/Screens/SplashScreen/splashScreen.dart';
import 'package:mere_maahi_dummy/application/auth/auth_bloc_bloc.dart';
import 'package:mere_maahi_dummy/application/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:mere_maahi_dummy/application/matches/matches_fetch_bloc.dart';
import 'package:mere_maahi_dummy/application/partner_pref/partner_pref_bloc.dart';
import 'package:mere_maahi_dummy/application/user/userdetails_bloc.dart';
import 'package:mere_maahi_dummy/firebase_options.dart';
import 'package:mere_maahi_dummy/push_nottification/push_nottification.dart';
import 'package:mere_maahi_dummy/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getAccessTocken();

  checkUserLogin();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // final _messageStreamController = BehaviorSubject<RemoteMessage>();
  // ZegoUIKit().initLog().then((value) {
  //   ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
  //     [ZegoUIKitSignalingPlugin()],
  //   );
  // });
  await PushNotification.init();
// checkUserLogin()
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
          BlocProvider(create: (context) => BottomNavBloc()),
          BlocProvider(create: (context) => PartnerPrefBloc()),
          BlocProvider(create: (context) => AuthBlocBloc()),
          BlocProvider(create: (context) => UserdetailsBloc()),
          BlocProvider(create: (context) => MatchesFetchBloc()),
        ],
        child: MaterialApp(
            title: 'Mera Maahi_02',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            navigatorKey: navigatorKey,
            // initialRoute: AppRoutes.splashScreen,
            // routes: AppRoutes.routes,
            home: accesstocken == null
                ? const SplashScreen()
                : const MainScreen()));
  }
}

dynamic loginTockenkey = '';
dynamic userlogin;
// Future<void> checkUserLogin() async {
//   final sharedpreference = await SharedPreferences.getInstance();
//   userlogin = sharedpreference.getString(loginTockenkey);
// }

// void saveinfo(String value) async {
//   print('this is value $value');
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   await preferences.setString(loginTockenkey, value);
// }

// Future<void> clearLoginInfo() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.clear();
// }

// dynamic accesstocken;
// Future<void> getAccessTocken() async {
//   final sharedpreference = await SharedPreferences.getInstance();
//   accesstocken = sharedpreference.getString(accessTockenkey);
// }
// final navigatorKey = GlobalKey<NavigatorState>();
// dynamic loginTockenkey =
//     'login_token'; // Ensure the key is initialized with a valid string
// dynamic userlogin;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await checkUserLogin(); // Await the checkUserLogin to ensure it completes

//   await PushNotification.init();
//   await PushNotification.localNotiInit();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//         providers: [
//           BlocProvider(create: (context) => BottomNavBloc()),
//           BlocProvider(create: (context) => PartnerPrefBloc()),
//           BlocProvider(create: (context) => AuthBlocBloc()),
//         ],
//         child: MaterialApp(
//           title: 'Mera Maahi_02',
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//             useMaterial3: true,
//           ),
//           navigatorKey: navigatorKey,
//           home: userlogin == null ? const SplashScreen() : const MainScreen(),
//         ));
//   }
// }

Future<void> checkUserLogin() async {
  final sharedpreference = await SharedPreferences.getInstance();
  userlogin = sharedpreference.getString(loginTockenkey);
}

void saveinfo(String value) async {
  print('this is value $value');
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString(loginTockenkey, value);
  getAccessTocken();
}

Future<void> clearLoginInfo() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

dynamic accesstocken;
Future<void> getAccessTocken() async {
  final sharedpreference = await SharedPreferences.getInstance();
  accesstocken = sharedpreference.getString(loginTockenkey);
}
