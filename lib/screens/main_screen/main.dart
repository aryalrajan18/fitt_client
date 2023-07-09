import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

// pages(screen)
import 'package:fitt_client/screens/main_screen/home_screen/home.dart';
import 'package:fitt_client/screens/main_screen/discover_screen/discover.dart';
import 'package:fitt_client/screens/main_screen/progress_screen/progress.dart';
import 'package:fitt_client/screens/main_screen/profile_screen/profile.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List pageTitles = ['Home', 'Discover', 'Progress', 'Profile'];

  List pages = const [Home(), Discover(), Progress(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: kLightColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text(
          pageTitles[_selectedIndex],
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: kDarkColor,
          ),
        ),
        backgroundColor: kLightColor,
        elevation: 0.5,
        toolbarHeight: 75,
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kLightColor,
        iconSize: double.parse('30'),
        elevation: 10.0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kPrimaryColor.withOpacity(0.7),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timer,
            ),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
