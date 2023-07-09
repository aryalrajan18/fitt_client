import 'package:fitt_client/provider/progress_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// routes
import 'package:fitt_client/routes/routes.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

// services
import 'package:fitt_client/services/user_service.dart';

// providers
import 'package:fitt_client/provider/user_provider.dart';
import 'package:fitt_client/provider/workout_provider.dart';
import 'package:fitt_client/provider/plan_provider.dart';

// screens
import 'package:fitt_client/screens/starting_screen/starting.dart';
import 'package:fitt_client/screens/main_screen/main.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => WorkoutProvider()),
        ChangeNotifierProvider(create: (context) => PlanProvider()),
        ChangeNotifierProvider(create: (context) => ProgressProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserService userService = UserService();

  @override
  void initState() {
    super.initState();
    userService.getUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitt',
      theme: ThemeData(
        scaffoldBackgroundColor: kLightColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.fullname.isEmpty
          ? const StartingScreen()
          : const MainScreen(),
    );
  }
}
