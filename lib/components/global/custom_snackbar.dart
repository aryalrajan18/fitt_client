import 'package:fitt_client/utils/constants.dart';
import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(
          color: kLightColor,
          fontFamily: "OpenSans",
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
