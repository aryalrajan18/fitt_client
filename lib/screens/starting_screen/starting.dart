import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

// components
import 'package:fitt_client/screens/starting_screen/sub_screens/loading.dart';
import 'package:fitt_client/screens/starting_screen/sub_screens/intro.dart';
import 'package:fitt_client/screens/starting_screen/sub_screens/info.dart';
import 'package:fitt_client/screens/starting_screen/sub_screens/level.dart';
import 'package:fitt_client/screens/starting_screen/sub_screens/goal.dart';

class StartingScreen extends StatefulWidget {
  static const String routeName = '/';

  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  final PageController pageController = PageController(
    initialPage: 0,
  );

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController genderController = TextEditingController(
    text: 'Male',
  );
  final TextEditingController levelController = TextEditingController();
  final TextEditingController goalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: kLightColor,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
          backgroundColor: kLightColor,
          toolbarHeight: 0,
        ),
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Loading(
              pageController: pageController,
            ),
            Intro(
              pageController: pageController,
            ),
            Info(
              pageController: pageController,
              fullnameController: fullnameController,
              ageController: ageController,
              weightController: heightController,
              heightController: weightController,
              genderController: genderController,
            ),
            Level(
              pageController: pageController,
              fullnameController: fullnameController,
              ageController: ageController,
              weightController: heightController,
              heightController: weightController,
              genderController: genderController,
              levelController: levelController,
            ),
            Goal(
              pageController: pageController,
              fullnameController: fullnameController,
              ageController: ageController,
              weightController: heightController,
              heightController: weightController,
              genderController: genderController,
              levelController: levelController,
              goalController: goalController,
            ),
          ],
        ),
      ),
    );
  }
}
