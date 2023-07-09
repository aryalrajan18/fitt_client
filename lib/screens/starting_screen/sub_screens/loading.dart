import 'package:flutter/material.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

class Loading extends StatelessWidget {
  final PageController pageController;
  const Loading({Key? key, required this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              const Image(image: AssetImage('assets/images/app_logo.png')),
              const Text(
                'Fitt',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontFamily: 'OpenSans',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 140,
              ),
              ElevatedButton(
                onPressed: () {
                  pageController.animateToPage(1,
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
                  'Get Started',
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
      ),
    );
  }
}
