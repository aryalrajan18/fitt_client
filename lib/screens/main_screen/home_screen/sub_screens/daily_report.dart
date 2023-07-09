import 'package:fitt_client/provider/plan_provider.dart';
import 'package:fitt_client/provider/progress_provider.dart';
import 'package:fitt_client/services/progress_service.dart';
import 'package:flutter/material.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

// screens
import 'package:fitt_client/screens/main_screen/main.dart';
import 'package:provider/provider.dart';

class DailyReport extends StatefulWidget {
  final int seconds, minutes, hours;
  final String digitSeconds, digitMinutes, digitHours;

  const DailyReport({
    Key? key,
    required this.seconds,
    required this.minutes,
    required this.hours,
    required this.digitHours,
    required this.digitMinutes,
    required this.digitSeconds,
  }) : super(key: key);

  @override
  State<DailyReport> createState() => _DailyReportState();
}

class _DailyReportState extends State<DailyReport> {
  ProgressService progressService = ProgressService();

  void updateProgress(seconds, minutes, hours) {
    int totalWorkouts = 2;

    DateTime startTime = DateTime.now().subtract(Duration(
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    ));

    progressService.updateProgress(
      workouts: totalWorkouts,
      timeStart: startTime,
      timeEnd: DateTime.now(),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kLightColor,
      ),
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 360,
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/default_placeholder.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'WORKOUT',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 28.0,
                      fontWeight: FontWeight.w900,
                      color: kDarkColor,
                    ),
                  ),
                  Text(
                    'COMPLETED!',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 28.0,
                      fontWeight: FontWeight.w900,
                      color: kDarkColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Day 0${Provider.of<ProgressProvider>(context).progress.activeDay.length + 1}',
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 24.0,
                      fontWeight: FontWeight.w900,
                      color: kDarkColor,
                    ),
                  ),
                  Text(
                    Provider.of<PlanProvider>(context).plan.name,
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                      color: kDarkColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ReportCard(
                          title:
                              '0${Provider.of<PlanProvider>(context).plan.weeks[(Provider.of<ProgressProvider>(context).progress.activeDay.length / 7).floor()].days[Provider.of<ProgressProvider>(context).progress.activeDay.length - (7 * (Provider.of<ProgressProvider>(context).progress.activeDay.length / 7).floor())].workouts.length}',
                          subtitle: 'Workouts'),
                      const SizedBox(
                        width: 50,
                      ),
                      ReportCard(
                          title:
                              '${widget.digitHours}:${widget.digitMinutes}:${widget.digitSeconds}',
                          subtitle: 'Duration'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: ElevatedButton(
            onPressed: () {
              // updateProgress(widget.seconds, widget.minutes, widget.hours);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(15),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            child: const Text(
              'Finish',
              style: TextStyle(
                color: kLightColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const ReportCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 28.0,
            fontWeight: FontWeight.w900,
            color: kDarkColor,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: Color(0xAA130F40),
          ),
        ),
      ],
    );
  }
}
