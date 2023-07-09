import 'package:flutter/material.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

// componets
import 'package:fitt_client/components/starting/custom_checkbox.dart';

//ignore: must_be_immutable
class Level extends StatefulWidget {
  final PageController pageController;

  TextEditingController fullnameController;
  TextEditingController ageController;
  TextEditingController weightController;
  TextEditingController heightController;
  TextEditingController genderController;
  TextEditingController levelController;

  Level({
    Key? key,
    required this.pageController,
    required this.ageController,
    required this.fullnameController,
    required this.heightController,
    required this.weightController,
    required this.genderController,
    required this.levelController,
  }) : super(key: key);

  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {
  String labelText =
      "What’s your experience level on using workout equipments ?";
  List<String> levels = ['Beginner', 'Intermediate', 'Expert'];
  List<String> imagesValue = const [
    'assets/images/starting/beginner.png',
    'assets/images/starting/intermediate.png',
    'assets/images/starting/expert.png',
  ];
  List<bool> levelsChecked = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: kPrimaryColor,
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(40, 40),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  widget.pageController.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn,
                  );
                },
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: kLightColor,
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              CustomCheckbox(
                labelName: labelText,
                values: levels,
                images: imagesValue,
                isChecked: levelsChecked,
              ),
              const SizedBox(
                height: 75,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      if (levelsChecked.contains(true)) {
                        var index = levelsChecked.indexOf(true);
                        setState(() {
                          widget.levelController.text = levels[index];
                        });

                        widget.pageController.animateToPage(4,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeIn);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: kPrimaryColor,
                      minimumSize: const Size(150, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
