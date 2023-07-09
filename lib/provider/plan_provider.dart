import 'dart:convert';

import 'package:flutter/material.dart';

// models
import 'package:fitt_client/models/plan.dart';

class PlanProvider extends ChangeNotifier {
  Plan _plan = Plan(
    id: '',
    name: '',
    desc: '',
    level: '',
    goal: '',
    totalWeeks: 0,
    weeks: [],
  );

  Plan get plan => _plan;

  void setPlan(plan) {
    _plan = Plan.fromJson(jsonDecode(plan)['data']);
    notifyListeners();
  }
}
