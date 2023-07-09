import 'package:flutter/material.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

class Badge extends StatelessWidget {
  final Color textColor;
  final Color bgColor;
  final String text;

  const Badge({
    Key? key,
    required this.text,
    this.textColor = kLightColor,
    this.bgColor = kPrimaryColor,
  }) : super(key: key);

  String capitalizeAllWord(String value) {
    var result = value[0].toUpperCase();
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " ") {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        capitalizeAllWord(text),
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
