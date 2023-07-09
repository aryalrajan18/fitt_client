import 'package:flutter/material.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

//ignore: must_be_immutable
class CustomCheckbox extends StatefulWidget {
  CustomCheckbox({
    Key? key,
    required this.labelName,
    required this.values,
    required this.images,
    required this.isChecked,
  }) : super(key: key);

  final String labelName;
  final List values;
  final List images;
  List<bool> isChecked;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.labelName,
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: kDarkColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: SizedBox(
            height: 75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CheckboxListTile(
                  value: widget.isChecked[0],
                  onChanged: (newIsChecked) {
                    setState(() {
                      widget.isChecked[0] = !widget.isChecked[0];
                      widget.isChecked[1] = false;
                      widget.isChecked[2] = false;
                    });
                  },
                  activeColor: kPrimaryColor,
                  checkColor: kLightColor,
                  title: Text(
                    widget.values[0],
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  secondary: Image(
                    image: AssetImage("${widget.images[0]}"),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: kDarkColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: SizedBox(
            height: 75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CheckboxListTile(
                  value: widget.isChecked[1],
                  onChanged: (newIsChecked) {
                    setState(() {
                      widget.isChecked[0] = false;
                      widget.isChecked[1] = !widget.isChecked[1];
                      widget.isChecked[2] = false;
                    });
                  },
                  activeColor: kPrimaryColor,
                  checkColor: kLightColor,
                  title: Text(
                    widget.values[1],
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  secondary: Image(
                    image: AssetImage("${widget.images[1]}"),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: kDarkColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: SizedBox(
            height: 75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CheckboxListTile(
                  value: widget.isChecked[2],
                  onChanged: (newIsChecked) {
                    setState(() {
                      widget.isChecked[0] = false;
                      widget.isChecked[1] = false;
                      widget.isChecked[2] = !widget.isChecked[2];
                    });
                  },
                  activeColor: kPrimaryColor,
                  checkColor: kLightColor,
                  title: Text(
                    widget.values[2],
                    style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  secondary: Image(
                    image: AssetImage("${widget.images[2]}"),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
