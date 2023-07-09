import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

// components
import 'package:fitt_client/components/global/custom_snackbar.dart';

// screens
import 'package:fitt_client/screens/main_screen/main.dart';

// handlers
import 'package:fitt_client/helpers/response_handler.dart';

// providers
import 'package:fitt_client/provider/user_provider.dart';

// models
import 'package:fitt_client/models/request_user.dart';

//constants
import 'package:fitt_client/utils/constants.dart';

const baseUrl = '$serverUrl:9999/api';

class UserService {
  void storeUser({
    required String fullname,
    required dynamic age,
    required String gender,
    required dynamic weight,
    required dynamic height,
    required String level,
    required String goal,
    required BuildContext context,
  }) async {
    try {
      RequestUser user = RequestUser(
        fullname: fullname,
        age: age,
        gender: gender,
        weight: weight,
        height: height,
        level: level,
        goal: goal,
      );

      http.Response response = await http.post(
        Uri.parse('$baseUrl/users/store'),
        body: user.toJson(),
      );

      responseHandler(
        response: response,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(
              'userid', jsonDecode(response.body)['data']['_id']);

          // ignore: use_build_context_synchronously
          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainScreen.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      customSnackBar(
        context,
        e.toString(),
      );
    }
  }

  void getUser(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userid = prefs.getString('userid');

      if (userid == null) {
        prefs.setString('userid', '');
      } else {
        http.Response response = await http.get(
          Uri.parse('$baseUrl/users/$userid'),
        );
        // ignore: use_build_context_synchronously
        Provider.of<UserProvider>(
          context,
          listen: false,
        ).setUser(response.body);
      }
    } catch (e) {
      customSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
