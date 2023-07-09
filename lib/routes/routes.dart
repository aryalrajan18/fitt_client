import 'package:flutter/material.dart';

// screens
import 'package:fitt_client/screens/starting_screen/starting.dart';
import 'package:fitt_client/screens/main_screen/main.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case StartingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const StartingScreen(),
      );
    case MainScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MainScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text(
              '404: Page Not Found',
              style: TextStyle(
                color: kDarkColor,
                fontFamily: 'OpenSans',
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      );
  }
}
