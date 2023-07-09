import 'package:flutter/material.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final double fieldWidth;
  final String labelText;
  final TextInputType type;
  final String hintText;
  final TextEditingController controllerValue;

  const CustomTextField({
    Key? key,
    required this.fieldWidth,
    required this.labelText,
    required this.type,
    required this.hintText,
    required this.controllerValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: fieldWidth,
          height: 75,
          child: TextFormField(
            cursorColor: kDarkColor,
            keyboardType: type,
            controller: controllerValue,
            decoration: InputDecoration(
              helperText: '',
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: kDarkColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: kDarkColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: (value) {
              return (value!.isEmpty) ? 'Required' : null;
            },
          ),
        ),
      ],
    );
  }
}
