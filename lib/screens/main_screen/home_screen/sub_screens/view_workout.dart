import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

// screens
import 'package:fitt_client/screens/main_screen/home_screen/sub_screens/daily_report.dart';

class ViewWorkout extends StatefulWidget {
  const ViewWorkout({Key? key}) : super(key: key);

  @override
  State<ViewWorkout> createState() => _ViewWorkoutState();
}

class _ViewWorkoutState extends State<ViewWorkout> {
  final PageController pageController = PageController(
    initialPage: 0,
  );

  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = '00', digitMinutes = '00', digitHours = '00';
  Timer? timer;
  bool isRunning = true;

  void stop() {
    timer!.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void start() {
    isRunning = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours = localHours + 1;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }

      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;

        digitSeconds = (seconds >= 10) ? '$seconds' : '0$seconds';
        digitMinutes = (minutes >= 10) ? '$minutes' : '0$minutes';
        digitHours = (hours >= 10) ? '$hours' : '0$hours';
      });
    });
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kLightColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: kLightColor,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: kLightColor,
          elevation: 1.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: kDarkColor,
              size: 20.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$digitHours:$digitMinutes:$digitSeconds',
                    style: const TextStyle(
                      color: kDarkColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ReadyScreen(
              pageController: pageController,
              workoutName: 'Bench Press',
              weight: 10,
              next: 1,
              set: 1,
              sets: 2,
            ),
            TimerScreen(
              pageController: pageController,
              workoutName: 'Bench Press',
              rep: 10,
              next: 2,
              set: 1,
              sets: 2,
            ),
            RestScreen(
              pageController: pageController,
              next: 3,
              set: 2,
              sets: 2,
            ),
            ReadyScreen(
              pageController: pageController,
              workoutName: 'Bench Press',
              weight: 15,
              next: 4,
              set: 2,
              sets: 2,
            ),
            TimerScreen(
              pageController: pageController,
              workoutName: 'Bench Press',
              rep: 8,
              next: 5,
              set: 2,
              sets: 2,
            ),
            NextScreen(
              pageController: pageController,
              next: 6,
              workoutName: 'Dumbbell Chest Fly',
            ),
            ReadyScreen(
              pageController: pageController,
              workoutName: 'Dumbbell Chest Fly',
              weight: 10,
              next: 7,
              set: 1,
              sets: 2,
            ),
            TimerScreen(
              pageController: pageController,
              workoutName: 'Dumbbell Chest Fly',
              rep: 10,
              next: 8,
              set: 1,
              sets: 2,
            ),
            RestScreen(
              pageController: pageController,
              next: 9,
              set: 2,
              sets: 2,
            ),
            ReadyScreen(
              pageController: pageController,
              workoutName: 'Dumbbell Chest Fly',
              weight: 15,
              next: 10,
              set: 2,
              sets: 2,
            ),
            TimerScreen(
              pageController: pageController,
              workoutName: 'Dumbbell Chest Fly',
              rep: 8,
              next: 11,
              set: 2,
              sets: 2,
              isFinished: true,
              seconds: seconds,
              minutes: minutes,
              hours: hours,
              digitSeconds: digitSeconds,
              digitMinutes: digitMinutes,
              digitHours: digitHours,
            ),
          ],
        ),
      ),
    );
  }
}

class ReadyScreen extends StatelessWidget {
  final PageController pageController;
  final String workoutName;
  final int weight;
  final int next;
  final int set;
  final int sets;

  const ReadyScreen({
    Key? key,
    required this.pageController,
    required this.workoutName,
    required this.weight,
    required this.next,
    required this.set,
    required this.sets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 275,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/default_placeholder.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '$workoutName ($set/$sets)',
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: kDarkColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Rack ${weight}kg of weight',
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: kDarkColor,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 125,
          height: 125,
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(0),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(125.0),
                ),
              ),
            ),
            onPressed: () {
              pageController.animateToPage(
                next,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeIn,
              );
            },
            child: const Text(
              "Ready",
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: kLightColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class TimerScreen extends StatelessWidget {
  final PageController pageController;
  final String workoutName;
  final int rep;
  final int next;
  final int set;
  final int sets;
  final bool isFinished;
  final int seconds, minutes, hours;
  final String digitSeconds, digitMinutes, digitHours;

  const TimerScreen({
    Key? key,
    required this.pageController,
    required this.workoutName,
    required this.rep,
    required this.next,
    required this.set,
    required this.sets,
    this.isFinished = false,
    this.seconds = 0,
    this.minutes = 0,
    this.hours = 0,
    this.digitSeconds = '00',
    this.digitMinutes = '00',
    this.digitHours = '00',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 275,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/default_placeholder.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '$workoutName ($set/$sets)',
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: kDarkColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Repeat $rep times',
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: kDarkColor,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 125,
          height: 125,
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(0),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(125.0),
                ),
              ),
            ),
            onPressed: () {
              if (!isFinished) {
                pageController.animateToPage(
                  next,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeIn,
                );
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailyReport(
                        seconds: seconds,
                        minutes: minutes,
                        hours: hours,
                        digitHours: digitHours,
                        digitMinutes: digitMinutes,
                        digitSeconds: digitSeconds,
                      ),
                    ));
              }
            },
            child: const Text(
              "Done",
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: kLightColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class RestScreen extends StatelessWidget {
  final PageController pageController;
  final int next;
  final int set;
  final int sets;

  const RestScreen({
    Key? key,
    required this.pageController,
    required this.set,
    required this.sets,
    required this.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int milisec = 120000;
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 275,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/default_placeholder.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Rest',
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: kDarkColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Next: Set $set/$sets',
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: kDarkColor,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: milisec),
          builder: (context, double value, _) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 125,
                  height: 125,
                  child: CircularProgressIndicator(
                    value: value,
                    strokeWidth: 7.5,
                    backgroundColor: kInActiveColor,
                    color: kPrimaryColor,
                  ),
                ),
                Text(
                  (120 * value).round().toString(),
                  style: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: kDarkColor,
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(kPrimaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(125.0),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "+10s",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: kLightColor,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(kPrimaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(125.0),
                  ),
                ),
              ),
              onPressed: () {
                pageController.animateToPage(
                  next,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeIn,
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: kLightColor,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class NextScreen extends StatelessWidget {
  final PageController pageController;
  final int next;
  final String workoutName;

  const NextScreen({
    Key? key,
    required this.pageController,
    required this.next,
    required this.workoutName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int milisec = 120000;

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Rest',
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: kDarkColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Next: $workoutName',
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: kDarkColor,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: milisec),
          builder: (context, double value, _) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 125,
                  height: 125,
                  child: CircularProgressIndicator(
                    value: value,
                    strokeWidth: 7.5,
                    backgroundColor: kInActiveColor,
                    color: kPrimaryColor,
                  ),
                ),
                Text(
                  (120 * value).round().toString(),
                  style: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: kDarkColor,
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(kPrimaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(125.0),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "+10s",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: kLightColor,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(kPrimaryColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(125.0),
                  ),
                ),
              ),
              onPressed: () {
                pageController.animateToPage(
                  next,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeIn,
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: kLightColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.maxFinite,
          height: 275,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/default_placeholder.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
