import 'package:flutter/material.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

// componets
import 'package:fitt_client/components/starting/custom_checkbox.dart';

// services
import 'package:fitt_client/services/user_service.dart';

//ignore: must_be_immutable
class Goal extends StatefulWidget {
  final PageController pageController;

  TextEditingController fullnameController;
  TextEditingController ageController;
  TextEditingController weightController;
  TextEditingController heightController;
  TextEditingController genderController;
  TextEditingController levelController;
  TextEditingController goalController;

  Goal({
    Key? key,
    required this.pageController,
    required this.ageController,
    required this.fullnameController,
    required this.heightController,
    required this.weightController,
    required this.genderController,
    required this.levelController,
    required this.goalController,
  }) : super(key: key);

  @override
  State<Goal> createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  String labelText = "What’s your end goal that you want to achieve ? ";
  List<String> goals = ['Gain Weight', 'Maintain Health', 'Loss Weight'];
  List<String> imagesValue = [
    'assets/images/starting/gain_weight.png',
    'assets/images/starting/maintain_health.png',
    'assets/images/starting/loss_weight.png',
  ];
  List<bool> goalsChecked = [false, false, false];

  @override
  Widget build(BuildContext context) {
    UserService userService = UserService();

    void storeUserInfo() {
      userService.storeUser(
        fullname: widget.fullnameController.text,
        age: widget.ageController.text,
        gender: widget.genderController.text,
        weight: widget.weightController.text,
        height: widget.heightController.text,
        level: widget.levelController.text,
        goal: widget.goalController.text,
        context: context,
      );
    }

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
                    3,
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
                values: goals,
                images: imagesValue,
                isChecked: goalsChecked,
              ),
              const SizedBox(
                height: 75,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      if (goalsChecked.contains(true)) {
                        var index = goalsChecked.indexOf(true);
                        setState(() {
                          widget.goalController.text = goals[index];
                        });

                        storeUserInfo();
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
                      'Finish',
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
