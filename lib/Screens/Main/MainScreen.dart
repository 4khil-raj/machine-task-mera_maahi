import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Screens/Account/accountScreen.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/ChatScreen.dart';
import 'package:mere_maahi_dummy/Screens/HomeScreen/main_screen_nav.dart';
import 'package:mere_maahi_dummy/Screens/Main/usermodel.dart';
import 'package:mere_maahi_dummy/Screens/MatchesScreen/matches_screen.dart';
import 'package:mere_maahi_dummy/Screens/SplashScreen/splash_service.dart';

CurrentUserModel? users;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const MainScreenNav(),
    const MatchesScreen(),
    const ChatScreen(),
    const AccountScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    // get();
  }

  // void get() async {
  //   User? user;
  //   user = FirebaseAuth.instance.currentUser;
  //   final data =
  //       await FirebaseFirestore.instance.collection('userDetails').doc().get();
  //   final theUser = data.data();
  //   users = CurrentUserModel(
  //     email: theUser?['email'],
  //   );
  //   print(users?.email);
  // }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 1), () {
    //   final auth = FirebaseAuth.instance;rr
    //   final user = auth.currentUser;
    //   if (user != null) {
    //     userId = user.email;
    //     print('============+++++++++++++++++++++++++++++++++++======');
    //     print(user.email);
    //     print(userId);
    //   }
    // });
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}


///
/// ElevatedButton(
//             style:
//                 ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent),
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                       builder: (builder) => const OnboardingThreeScreen()),
//                   (route) => false);
//             },
//             child: const Text(
//               'SingOut',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),