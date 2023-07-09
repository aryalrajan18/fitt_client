import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// handlers
import 'package:fitt_client/helpers/response_handler.dart';

// components
import 'package:fitt_client/components/global/custom_snackbar.dart';

// models
import 'package:fitt_client/models/workout.dart';

// providers
import 'package:fitt_client/provider/workout_provider.dart';

//constants
import 'package:fitt_client/utils/constants.dart';

const baseUrl = '$serverUrl:9999/api';

class WorkoutService {
  List<Workout> workoutList = [];

  void getWorkouts(BuildContext context) async {
    try {
      http.Response response = await http.get(
        Uri.parse('$baseUrl/workouts'),
      );

      responseHandler(
        response: response,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(response.body)['data'].length; i++) {
            workoutList.add(
              Workout.fromJson(jsonDecode(response.body)['data'][i]),
            );
          }
          Provider.of<WorkoutProvider>(
            context,
            listen: false,
          ).setWorkouts(workoutList);
        },
      );
    } catch (e) {
      customSnackBar(context, e.toString());
    }
  }
}
