import 'dart:convert';

import 'package:flutter/material.dart';

// models
import 'package:fitt_client/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    fullname: '',
    age: 0,
    gender: '',
    weight: 0.0,
    height: 0.0,
    level: '',
    goal: '',
  );

  User get user => _user;

  void setUser(user) {
    _user = User.fromJson(jsonDecode(user)['data']);
    notifyListeners();
  }
}
