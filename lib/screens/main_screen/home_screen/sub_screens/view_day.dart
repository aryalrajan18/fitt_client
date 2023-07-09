import 'package:fitt_client/provider/plan_provider.dart';
import 'package:fitt_client/provider/progress_provider.dart';
import 'package:fitt_client/provider/workout_provider.dart';
import 'package:flutter/material.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

// screens
import 'package:fitt_client/screens/main_screen/home_screen/sub_screens/view_workout.dart';
import 'package:provider/provider.dart';

class ViewDay extends StatefulWidget {
  const ViewDay({Key? key}) : super(key: key);

  @override
  State<ViewDay> createState() => _ViewDayState();
}

class _ViewDayState extends State<ViewDay> {
  final List<Map<String, String>> workouts = <Map<String, String>>[
    {
      'name': 'Bench Press',
      'sets': '2',
    },
    {
      'name': 'Cable Crossover',
      'sets': '2',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kLightColor,
      ),
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 300,
              toolbarHeight: 75,
              backgroundColor: kLightColor,
              elevation: 0.75,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/default_placeholder.png',
                  fit: BoxFit.cover,
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                      color: kDarkColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.more_vert,
                      size: 24,
                      color: kDarkColor,
                    ),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(70),
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding,
                  ),
                  decoration: const BoxDecoration(
                    color: kLightColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Day 0${Provider.of<ProgressProvider>(context).progress.activeDay.length + 1}',
                        style: const TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Workouts',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: kDarkColor,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '(${Provider.of<PlanProvider>(context).plan.weeks[(Provider.of<ProgressProvider>(context).progress.activeDay.length / 7).floor()].days[Provider.of<ProgressProvider>(context).progress.activeDay.length - (7 * (Provider.of<ProgressProvider>(context).progress.activeDay.length / 7).floor())].workouts.length})',
                          style: const TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0x88130F40),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Provider.of<PlanProvider>(context)
                          .plan
                          .weeks[(Provider.of<ProgressProvider>(context)
                                      .progress
                                      .activeDay
                                      .length /
                                  7)
                              .floor()]
                          .days[Provider.of<ProgressProvider>(context)
                                  .progress
                                  .activeDay
                                  .length -
                              (7 *
                                  (Provider.of<ProgressProvider>(context)
                                              .progress
                                              .activeDay
                                              .length /
                                          7)
                                      .floor())]
                          .workouts
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        return WorkoutCard(
                          workoutId: Provider.of<PlanProvider>(context)
                              .plan
                              .weeks[(Provider.of<ProgressProvider>(context)
                                          .progress
                                          .activeDay
                                          .length /
                                      7)
                                  .floor()]
                              .days[Provider.of<ProgressProvider>(context)
                                      .progress
                                      .activeDay
                                      .length -
                                  (7 *
                                      (Provider.of<ProgressProvider>(context)
                                                  .progress
                                                  .activeDay
                                                  .length /
                                              7)
                                          .floor())]
                              .workouts[index]
                              .wid,
                          sets: Provider.of<PlanProvider>(context)
                              .plan
                              .weeks[(Provider.of<ProgressProvider>(context)
                                          .progress
                                          .activeDay
                                          .length /
                                      7)
                                  .floor()]
                              .days[Provider.of<ProgressProvider>(context)
                                      .progress
                                      .activeDay
                                      .length -
                                  (7 *
                                      (Provider.of<ProgressProvider>(context)
                                                  .progress
                                                  .activeDay
                                                  .length /
                                              7)
                                          .floor())]
                              .workouts[index]
                              .sets,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewWorkout(),
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
              'Start',
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

class WorkoutCard extends StatelessWidget {
  final String workoutId;
  final int sets;

  const WorkoutCard({
    Key? key,
    required this.workoutId,
    required this.sets,
  }) : super(key: key);

  getWorkoutName(context) {
    for (var i = 0;
        i < Provider.of<WorkoutProvider>(context).workouts.length;
        i++) {
      if (Provider.of<WorkoutProvider>(context).workouts[i].id == workoutId) {
        return Provider.of<WorkoutProvider>(context).workouts[i].name;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(7.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/default_placeholder.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7.5),
                bottomLeft: Radius.circular(7.5),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 225,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  getWorkoutName(context),
                  style: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: kDarkColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Sets x$sets',
                  style: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0x88130F40),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
