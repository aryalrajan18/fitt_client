import 'dart:convert';

import 'package:flutter/material.dart';

// models
import 'package:fitt_client/models/progress.dart';

class ProgressProvider extends ChangeNotifier {
  Progress _progress = Progress(
    userId: '',
    planId: '',
    planStart: DateTime.now(),
    id: '',
    activeDay: [],
  );

  Progress get progress => _progress;

  void setProgress(progress) {
    _progress = Progress.fromJson(jsonDecode(progress)['data']);
    notifyListeners();
  }
}
