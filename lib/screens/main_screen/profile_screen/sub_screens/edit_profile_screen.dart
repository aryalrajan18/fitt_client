import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
            'Edit Profile',
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
