import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mere_maahi_dummy/Firebase/currentuser_repo.dart';
import 'package:mere_maahi_dummy/Screens/Account/accountScreen.dart';
import 'package:mere_maahi_dummy/Screens/ChatScreen/ChatScreen.dart';
import 'package:mere_maahi_dummy/Screens/HomeScreen/main_screen_nav.dart';
import 'package:mere_maahi_dummy/Screens/MatchesScreen/matches_screen.dart';
import 'package:mere_maahi_dummy/application/bottom_nav_bloc/bottom_nav_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static final List<Widget> _widgetOptions = <Widget>[
    const MainScreenNav(),
    const MatchesScreen(),
    const ChatScreen(),
    const AccountScreen()
  ];

  @override
  void initState() {
    super.initState();
    CurrentUserRepo().fetchuserdatas();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(state.emittedIndex),
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
            currentIndex: state.emittedIndex,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black,
            onTap: (index) => BlocProvider.of<BottomNavBloc>(context)
                .add(BottomnavcallEvent(currentIndex: index)),
          ),
        );
      },
    );
  }
}
