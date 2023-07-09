import 'package:flutter/material.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

// components
import 'package:fitt_client/components/global/custom_textfield.dart';

//ignore: must_be_immutable
class Info extends StatefulWidget {
  final PageController pageController;

  TextEditingController fullnameController;
  TextEditingController ageController;
  TextEditingController weightController;
  TextEditingController heightController;
  TextEditingController genderController;

  Info({
    Key? key,
    required this.pageController,
    required this.ageController,
    required this.fullnameController,
    required this.heightController,
    required this.weightController,
    required this.genderController,
  }) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final infoFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(kDefaultPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: kDefaultPadding / 2,
            ),
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
                  1,
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
            Form(
              key: infoFormKey,
              child: Column(
                children: [
                  CustomTextField(
                    fieldWidth: double.maxFinite,
                    labelText: 'Full Name',
                    type: TextInputType.name,
                    hintText: 'Enter name',
                    controllerValue: widget.fullnameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(
                        fieldWidth:
                            (MediaQuery.of(context).size.width / 2) - 30,
                        labelText: 'Age',
                        type: TextInputType.number,
                        hintText: 'Enter in year',
                        controllerValue: widget.ageController,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Gender",
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: (MediaQuery.of(context).size.width / 2) - 30,
                            height: 75,
                            child: InputDecorator(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12.5,
                                  vertical: 15.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: DropdownButtonFormField(
                                value: widget.genderController.text,
                                decoration: const InputDecoration.collapsed(
                                  hintText: 'Select one',
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    widget.genderController.text = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Male',
                                  'Female',
                                  'Other',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextField(
                        fieldWidth:
                            (MediaQuery.of(context).size.width / 2) - 30,
                        labelText: 'Weight',
                        type: TextInputType.number,
                        hintText: 'Enter in kilogram',
                        controllerValue: widget.weightController,
                      ),
                      CustomTextField(
                        fieldWidth:
                            (MediaQuery.of(context).size.width / 2) - 30,
                        labelText: 'Height',
                        type: TextInputType.number,
                        hintText: 'Enter in meter',
                        controllerValue: widget.heightController,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          if (infoFormKey.currentState!.validate()) {
                            widget.pageController.animateToPage(3,
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
            )
          ],
        ),
      ),
    );
  }
}
