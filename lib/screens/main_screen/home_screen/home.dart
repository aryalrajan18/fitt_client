import 'package:fitt_client/provider/plan_provider.dart';
import 'package:fitt_client/services/progress_service.dart';
import 'package:fitt_client/services/workout_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

// screens
import 'package:fitt_client/screens/main_screen/home_screen/sub_screens/view_plan.dart';

// services
import 'package:fitt_client/services/plan_service.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PlanService planService = PlanService();
  final ProgressService progressService = ProgressService();
  final WorkoutService workoutService = WorkoutService();

  DateTime newDate = DateTime.now().subtract(Duration(
      days: DateTime.now().weekday > 6
          ? DateTime.now().weekday - 7
          : DateTime.now().weekday));

  List<DateTime> weekDates = [];

  _HomeState() {
    for (int i = 0; i < 7; i++) {
      DateTime addDate = newDate.add(Duration(days: i));
      weekDates.add(addDate);
    }
  }

  @override
  void initState() {
    super.initState();
    planService.getPlan(context);
    progressService.getProgress(context);
    workoutService.getWorkouts(context);
  }

  @override
  Widget build(BuildContext context) {
    return (SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('MMM yyy').format(DateTime.now()),
                  style: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: kDarkColor,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: weekDates
                      .map((weekDate) => DayCard(date: weekDate))
                      .toList(),
                )
              ],
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Plan',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: kDarkColor,
                  ),
                ),
                const SizedBox(
                  height: kDefaultPadding * 0.5,
                ),
                Card(
                  color: kPrimaryColor,
                  margin: const EdgeInsets.all(0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.5)),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: kDefaultPadding,
                        left: kDefaultPadding,
                        right: kDefaultPadding,
                        bottom: kDefaultPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '7x${Provider.of<PlanProvider>(context).plan.totalWeeks} PLAN',
                            style: const TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w800,
                              color: kLightColor,
                            ),
                          ),
                          Text(
                            Provider.of<PlanProvider>(context).plan.name,
                            style: const TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 32.0,
                              fontWeight: FontWeight.w800,
                              color: kLightColor,
                            ),
                          ),
                          SizedBox(
                            height: 90,
                            child: Text(
                              Provider.of<PlanProvider>(context).plan.desc,
                              style: const TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: kLightColor,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ViewPlan(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kLightColor,
                                elevation: 0.0,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Start',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class DayCard extends StatefulWidget {
  const DayCard({Key? key, required this.date}) : super(key: key);

  final DateTime date;

  @override
  State<DayCard> createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          elevation: 0,
          color: widget.date.day == DateTime.now().day
              ? kPrimaryColor
              : kLightColor,
          margin: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              width: 1.0,
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(7.5)),
          ),
          child: SizedBox(
            width: 45,
            height: 70,
            child: Center(
                child: Text(
              widget.date.day.toString(),
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                color: widget.date.day == DateTime.now().day
                    ? kLightColor
                    : kPrimaryColor,
              ),
            )),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          DateFormat('EEE').format(widget.date),
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: kDarkColor,
          ),
        )
      ],
    );
  }
}
