import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// components
import 'package:fitt_client/components/global/custom_snackbar.dart';

// handlers
import 'package:fitt_client/helpers/response_handler.dart';

// providers
import 'package:fitt_client/provider/plan_provider.dart';

//constants
import 'package:fitt_client/utils/constants.dart';

const baseUrl = '$serverUrl:9999/api';

class PlanService {
  void getPlan(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userid = prefs.getString('userid');
      String? planid = prefs.getString('planid');

      if (userid != null) {
        if (planid != null) {
          http.Response response = await http.get(
            Uri.parse('$baseUrl/plans/$planid'),
          );
          responseHandler(
            response: response,
            context: context,
            onSuccess: () {
              // ignore: use_build_context_synchronously
              Provider.of<PlanProvider>(context, listen: false)
                  .setPlan(response.body);
            },
          );
        } else {
          http.Response response = await http.get(
            Uri.parse('$baseUrl/plans/selected/$userid'),
          );

          responseHandler(
            response: response,
            context: context,
            onSuccess: () async {
              await prefs.setString(
                  'planid', jsonDecode(response.body)['data']['_id']);
              // ignore: use_build_context_synchronously
              Provider.of<PlanProvider>(context, listen: false)
                  .setPlan(response.body);
            },
          );
        }
      } else {
        prefs.setString('userid', '');
      }
    } catch (e) {
      customSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
