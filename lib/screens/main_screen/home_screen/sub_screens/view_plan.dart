import 'package:fitt_client/provider/plan_provider.dart';
import 'package:fitt_client/provider/progress_provider.dart';
import 'package:fitt_client/screens/main_screen/home_screen/sub_screens/view_day.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

// components
import 'package:fitt_client/components/home/plan_detail.dart';

class ViewPlan extends StatefulWidget {
  const ViewPlan({Key? key}) : super(key: key);

  @override
  State<ViewPlan> createState() => _ViewPlanState();
}

class _ViewPlanState extends State<ViewPlan> {
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
              expandedHeight: 325,
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
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return const FractionallySizedBox(
                                heightFactor: 0.9,
                                child: PlanDetail(),
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.info_outline,
                          size: 24,
                          color: kDarkColor,
                        ),
                      ),
                      const SizedBox(
                        width: 7.5,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return FractionallySizedBox(
                                heightFactor: 0.225,
                                child: Container(
                                  padding:
                                      const EdgeInsets.all(kDefaultPadding),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: double.maxFinite,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            elevation: MaterialStateProperty
                                                .all<double>(0),
                                            padding: MaterialStateProperty.all<
                                                EdgeInsets>(
                                              const EdgeInsets.all(15),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(kFailureColor),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                            ),
                                          ),
                                          child: const Text('Reset Plan',
                                              style: TextStyle(
                                                color: kLightColor,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w700,
                                              )),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: double.maxFinite,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ButtonStyle(
                                            elevation: MaterialStateProperty
                                                .all<double>(0),
                                            padding: MaterialStateProperty.all<
                                                EdgeInsets>(
                                              const EdgeInsets.all(15),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(kInActiveColor),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                            ),
                                          ),
                                          child: const Text(
                                            'Cancel',
                                            style: TextStyle(
                                              color: kDarkColor,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Icon(
                          Icons.more_vert,
                          size: 24,
                          color: kDarkColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(100),
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${Provider.of<ProgressProvider>(context).progress.activeDay.length} / ${Provider.of<PlanProvider>(context).plan.totalWeeks * 7}',
                            style: const TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            '${((Provider.of<ProgressProvider>(context).progress.activeDay.length / Provider.of<PlanProvider>(context).plan.totalWeeks) * 100).floor()}%',
                            style: const TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LinearProgressIndicator(
                        value: (Provider.of<ProgressProvider>(context)
                                .progress
                                .activeDay
                                .length /
                            (Provider.of<PlanProvider>(context)
                                    .plan
                                    .totalWeeks *
                                7)),
                        color: kDarkColor,
                        backgroundColor: kInActiveColor,
                        minHeight: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Provider.of<PlanProvider>(context).plan.totalWeeks,
                  itemBuilder: (BuildContext context, int index) {
                    return WeekTile(
                      week: index,
                      isFirst: index == 0 && true,
                      isLast: index ==
                              Provider.of<PlanProvider>(context)
                                      .plan
                                      .totalWeeks -
                                  1 &&
                          true,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeekTile extends StatelessWidget {
  final int week;
  final bool isFirst;
  final bool isLast;

  const WeekTile({
    Key? key,
    required this.week,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      axis: TimelineAxis.vertical,
      alignment: TimelineAlign.start,
      indicatorStyle: IndicatorStyle(
        width: 25,
        indicatorXY: 0,
        color:
            (Provider.of<ProgressProvider>(context).progress.activeDay.length /
                            7)
                        .floor() ==
                    week
                ? kPrimaryColor
                : kInActiveColor,
      ),
      beforeLineStyle: const LineStyle(
        color: kInActiveColor,
      ),
      isFirst: isFirst,
      isLast: isLast,
      endChild: Container(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        constraints: const BoxConstraints(
          minHeight: 125,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Week ${week + 1}',
              style: const TextStyle(
                  color: kDarkColor,
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: kInActiveColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextIcon(
                        weekNumber: week,
                        dayNumber: 1,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: kDarkColor,
                      ),
                      TextIcon(
                        weekNumber: week,
                        dayNumber: 2,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: kDarkColor,
                      ),
                      TextIcon(
                        weekNumber: week,
                        dayNumber: 3,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: kDarkColor,
                      ),
                      TextIcon(
                        weekNumber: week,
                        dayNumber: 4,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextIcon(
                        weekNumber: week,
                        dayNumber: 5,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: kDarkColor,
                      ),
                      TextIcon(
                        weekNumber: week,
                        dayNumber: 6,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: kDarkColor,
                      ),
                      TextIcon(
                        weekNumber: week,
                        dayNumber: 7,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: kDarkColor,
                      ),
                      AppIcon(
                        icon: Icons.star,
                        weekNumber: week,
                        dayNumber: 7,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        if ((Provider.of<ProgressProvider>(
                                      context,
                                      listen: false,
                                    ).progress.activeDay.length /
                                    7)
                                .floor() ==
                            week) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ViewDay(),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(10),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            (Provider.of<ProgressProvider>(
                                              context,
                                              listen: false,
                                            ).progress.activeDay.length /
                                            7)
                                        .floor() ==
                                    week
                                ? kPrimaryColor
                                : const Color(0x33130F40)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Start',
                        style: TextStyle(
                          color: kLightColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppIcon extends StatelessWidget {
  final IconData icon;
  final int weekNumber;
  final int dayNumber;

  const AppIcon({
    Key? key,
    required this.icon,
    required this.weekNumber,
    required this.dayNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: (7 * weekNumber) + dayNumber ==
                (Provider.of<ProgressProvider>(context)
                        .progress
                        .activeDay
                        .length +
                    1)
            ? kPrimaryColor
            : const Color(0x33130F40),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Icon(
        icon,
        size: 20,
        color: kLightColor,
      ),
    );
  }
}

class TextIcon extends StatelessWidget {
  final int weekNumber;
  final int dayNumber;

  const TextIcon({
    Key? key,
    required this.weekNumber,
    required this.dayNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: (7 * weekNumber) + dayNumber ==
                (Provider.of<ProgressProvider>(context)
                        .progress
                        .activeDay
                        .length +
                    1)
            ? kPrimaryColor
            : const Color(0x33130F40),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        '$dayNumber',
        style: const TextStyle(
          color: kLightColor,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
