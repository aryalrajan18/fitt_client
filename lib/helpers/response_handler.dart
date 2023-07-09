import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// components
import 'package:fitt_client/components/global/custom_snackbar.dart';

void responseHandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  if (response.statusCode >= 200 && response.statusCode < 400) {
    onSuccess();
  } else if (response.statusCode >= 400 && response.statusCode < 500) {
    // customSnackBar(context, jsonDecode(response.body)['message']);
  } else if (response.statusCode >= 500) {
    // customSnackBar(context, jsonDecode(response.body)['error']);
  } else {
    customSnackBar(context, response.body);
  }
}
