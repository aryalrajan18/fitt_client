import 'package:flutter/material.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

class Intro extends StatelessWidget {
  final PageController pageController;
  const Intro({Key? key, required this.pageController}) : super(key: key);

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
                  pageController.animateToPage(
                    0,
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
                height: 150.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Image(image: AssetImage('assets/icons/wave.png')),
                  Text(
                    'Here are some questions to prepare a personalized plan for you.',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: kDarkColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 150.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeIn);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: kPrimaryColor,
                      minimumSize: const Size(300, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    ),
                    child: const Text(
                      "I'm Ready",
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
