import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

class DefaultTheme extends StatefulWidget {
  const DefaultTheme({Key? key}) : super(key: key);

  @override
  State<DefaultTheme> createState() => _DefaultThemeState();
}

class _DefaultThemeState extends State<DefaultTheme> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kLightColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: kLightColor,
            statusBarIconBrightness: Brightness.dark,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: kDarkColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Default Theme',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: kDarkColor,
            ),
          ),
          backgroundColor: kLightColor,
          elevation: 0.5,
          toolbarHeight: 75,
        ),
      ),
    );
  }
}
