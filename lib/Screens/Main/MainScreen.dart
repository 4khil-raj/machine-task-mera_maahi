import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mere_maahi_dummy/Firebase/currentuser_repo.dart';
import 'package:mere_maahi_dummy/Screens/Account/accountScreen.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/ChatScreen.dart';
import 'package:mere_maahi_dummy/Screens/HomeScreen/main_screen_nav.dart';
import 'package:mere_maahi_dummy/Screens/MatchesScreen/matches_screen.dart';

// CurrentUserModel? users;

// List<UserFetchModel>? userFetchModel;

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
    super.initState();
    CurrentUserRepo().fetchuserdatas();
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
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
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