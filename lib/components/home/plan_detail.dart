import 'package:fitt_client/provider/plan_provider.dart';
import 'package:flutter/material.dart';

// constants
import 'package:fitt_client/utils/constants.dart';
import 'package:provider/provider.dart';

class PlanDetail extends StatefulWidget {
  const PlanDetail({Key? key}) : super(key: key);

  @override
  State<PlanDetail> createState() => _PlanDetailState();
}

class _PlanDetailState extends State<PlanDetail> {
  String capitalizeAllWord(String value) {
    var result = value[0].toUpperCase();
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " ") {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
      }
    }
    return result;
  }

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
              toolbarHeight: 20,
              expandedHeight: 250,
              backgroundColor: kLightColor,
              elevation: 0.75,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/default_placeholder.png',
                  fit: BoxFit.cover,
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 24,
                      color: kDarkColor,
                    ),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  width: double.maxFinite,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: kLightColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Provider.of<PlanProvider>(context).plan.name,
                      style: const TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 22.0,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      Provider.of<PlanProvider>(context).plan.desc,
                      style: const TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'About Program',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(0),
                      childAspectRatio: 4.5,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.bar_chart,
                              size: 26.0,
                              color: kPrimaryColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              capitalizeAllWord(
                                  Provider.of<PlanProvider>(context)
                                      .plan
                                      .level),
                              style: const TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.track_changes_outlined,
                              size: 26.0,
                              color: kPrimaryColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              capitalizeAllWord(
                                  Provider.of<PlanProvider>(context).plan.goal),
                              style: const TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.sports,
                              size: 26.0,
                              color: kPrimaryColor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              '30 workouts',
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 24.0,
                              color: kPrimaryColor,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${Provider.of<PlanProvider>(context).plan.totalWeeks} weeks',
                              style: const TextStyle(
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
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
              'Close',
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
