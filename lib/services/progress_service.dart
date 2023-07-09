import 'dart:convert';
import 'package:fitt_client/models/update_progress.dart';
import 'package:fitt_client/screens/main_screen/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// models
import 'package:fitt_client/models/request_progress.dart';

// components
import 'package:fitt_client/components/global/custom_snackbar.dart';

// handlers
import 'package:fitt_client/helpers/response_handler.dart';

// providers
import 'package:fitt_client/provider/progress_provider.dart';

//constants
import 'package:fitt_client/utils/constants.dart';

const baseUrl = '$serverUrl:9999/api';

class ProgressService {
  void getProgress(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userid = prefs.getString('userid');
      String? planid = prefs.getString('planid');
      String? progressid = prefs.getString('progressid');

      if (userid != null && planid != null && progressid != null) {
        http.Response response = await http.get(
          Uri.parse('$baseUrl/progresses/$userid'),
        );

        responseHandler(
          response: response,
          context: context,
          onSuccess: () async {
            await prefs.setString(
                'progressid', jsonDecode(response.body)['data']['_id']);
            // ignore: use_build_context_synchronously
            Provider.of<ProgressProvider>(context, listen: false)
                .setProgress(response.body);
          },
        );
      } else {
        RequestProgress progress = RequestProgress(
          planId: planid.toString(),
        );

        http.Response response = await http.post(
          Uri.parse('$baseUrl/progresses/create/$userid'),
          body: progress.toJson(),
        );

        responseHandler(
          response: response,
          context: context,
          onSuccess: () async {
            await prefs.setString(
                'progressid', jsonDecode(response.body)['data']['_id']);
            // ignore: use_build_context_synchronously
            Provider.of<ProgressProvider>(context, listen: false)
                .setProgress(response.body);
          },
        );
      }
    } catch (e) {
      customSnackBar(
        context,
        e.toString(),
      );
    }
  }

  void updateProgress({
    required dynamic workouts,
    required DateTime timeStart,
    required DateTime timeEnd,
    required BuildContext context,
  }) async {
    try {
      ActiveDay activeDay =
          ActiveDay(workouts: workouts, timeStart: timeStart, timeEnd: timeEnd);
      UpdateProgress updateProgress = UpdateProgress(
        activeDay: activeDay,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? progressid = prefs.getString('progressid');

      if (progressid != null) {
        http.Response response = await http.put(
          Uri.parse('$baseUrl/progresses/$progressid'),
          body: updateProgress.toJson(),
        );

        responseHandler(
            response: response,
            context: context,
            onSuccess: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
            });
      }
    } catch (e) {
      customSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
