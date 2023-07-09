import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

// screens
import 'package:fitt_client/screens/main_screen/discover_screen/sub_screens/workout_detail.dart';

// componets
import 'package:fitt_client/components/global/badge.dart';

// services
import 'package:fitt_client/services/workout_service.dart';

// models
import 'package:fitt_client/models/workout.dart';

// providers
import 'package:fitt_client/provider/workout_provider.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final WorkoutService workoutService = WorkoutService();

  @override
  void initState() {
    super.initState();

    workoutService.getWorkouts(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            SizedBox(
              height: 80.0,
              child: TextFormField(
                cursorColor: kDarkColor,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Search Workouts',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: kDarkColor, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kDarkColor, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Provider.of<WorkoutProvider>(context).workouts.length,
              itemBuilder: (BuildContext context, int index) {
                return WorkoutCard(
                  workout:
                      Provider.of<WorkoutProvider>(context).workouts[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkoutDetail(
              name: workout.name,
              desc: workout.desc,
              focusArea: workout.focusArea,
              steps: workout.steps,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  workout.name,
                  style: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: kDarkColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Badge(text: workout.focusArea),
              ],
            )
          ],
        ),
      ),
    );
  }
}
