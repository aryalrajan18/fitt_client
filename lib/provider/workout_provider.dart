import 'package:flutter/material.dart';

// models
import 'package:fitt_client/models/workout.dart';

class WorkoutProvider extends ChangeNotifier {
  final Workout _workout = Workout(
    id: '',
    name: '',
    focusArea: '',
    desc: '',
    steps: [],
  );

  List<Workout> _workouts = [];

  Workout get workout => _workout;
  List<Workout> get workouts => _workouts;

  void setWorkouts(workouts) {
    _workouts = workouts;
    notifyListeners();
  }
}
