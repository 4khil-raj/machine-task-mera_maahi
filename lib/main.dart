import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/relationship.dart';
import 'package:mere_maahi_dummy/Screens/ExtraScreen/thisProfileScreen.dart';
import 'package:mere_maahi_dummy/firebase_options.dart';
import 'package:mere_maahi_dummy/routes/app_routes.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mera Maahi_02',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
      // home: const ThisProfile(),
    );
  }
}
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ReligionCommunitySelector(),
//     );
//   }
// }

// class ReligionCommunitySelector extends StatefulWidget {
//   @override
//   _ReligionCommunitySelectorState createState() =>
//       _ReligionCommunitySelectorState();
// }

// class _ReligionCommunitySelectorState extends State<ReligionCommunitySelector> {
//   String? selectedReligion;
//   String? selectedCommunity;

//   final List<String> religions = [
//     'Hinduism',
//     'Christianity',
//     'Islam',
//     'Buddhism',
//     'Sikhism',
//     // Add more religions here
//   ];

//   final List<List<String>> communities = [
//     ['Brahmin', 'Kshatriya', 'Vaishya', 'Shudra'], // Communities for Hinduism
//     ['Catholic', 'Protestant', 'Orthodox'], // Communities for Christianity
//     ['Sunni', 'Shia'], // Communities for Islam
//     ['Theravada', 'Mahayana'], // Communities for Buddhism
//     ['Jat', 'Ramgarhia', 'Khatri'], // Communities for Sikhism
//     // Add more communities corresponding to the religions here
//   ];

//   List<String> getCommunitiesForSelectedReligion() {
//     if (selectedReligion == null) {
//       return [];
//     }
//     int index = religions.indexOf(selectedReligion!);
//     return communities[index];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Religion and Community Selector'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             DropdownButton<String>(
//               hint: Text('Select Religion'),
//               value: selectedReligion,
//               onChanged: (value) {
//                 setState(() {
//                   selectedReligion = value;
//                   selectedCommunity =
//                       null; // Reset community when religion changes
//                 });
//               },
//               items: religions.map((String religion) {
//                 return DropdownMenuItem<String>(
//                   value: religion,
//                   child: Text(religion),
//                 );
//               }).toList(),
//             ),
//             if (selectedReligion != null)
//               DropdownButton<String>(
//                 hint: Text('Select Community'),
//                 value: selectedCommunity,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedCommunity = value;
//                   });
//                 },
//                 items:
//                     getCommunitiesForSelectedReligion().map((String community) {
//                   return DropdownMenuItem<String>(
//                     value: community,
//                     child: Text(community),
//                   );
//                 }).toList(),
//               ),
//             SizedBox(height: 20.0),
//             if (selectedReligion != null && selectedCommunity != null)
//               Text(
//                   "Selected Religion: $selectedReligion\nSelected Community: $selectedCommunity"),
//           ],
//         ),
//       ),
//     );
//   }
// }
