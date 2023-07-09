import 'package:flutter/material.dart';

// constants
import 'package:fitt_client/utils/constants.dart';

// screens
import 'package:fitt_client/screens/main_screen/profile_screen/sub_screens/edit_profile_screen.dart';
import 'package:fitt_client/screens/main_screen/profile_screen/sub_screens/my_favourites_screen.dart';
import 'package:fitt_client/screens/main_screen/profile_screen/sub_screens/general_setting_screen.dart';
import 'package:fitt_client/screens/main_screen/profile_screen/sub_screens/default_theme_screen.dart';

// providers
import 'package:fitt_client/provider/user_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100.0),
                    ),
                  ),
                  child: SizedBox(
                    width: 125,
                    height: 125,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: const Image(
                        image: AssetImage('assets/images/default_avatar.jpg'),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Welcome, ${Provider.of<UserProvider>(context).user.fullname.split(' ')[0]}!',
              style: const TextStyle(
                color: kDarkColor,
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: const [
                SettingCard(
                  lableName: 'My Profile',
                  iconName: Icons.update,
                  widgetName: EditProfile(),
                ),
                SettingCard(
                  lableName: 'My Favorites',
                  iconName: Icons.star,
                  widgetName: MyFavourites(),
                ),
                SettingCard(
                  lableName: 'General Setting',
                  iconName: Icons.settings,
                  widgetName: GeneralSetting(),
                ),
                SettingCard(
                  lableName: 'Default Theme',
                  iconName: Icons.color_lens,
                  widgetName: DefaultTheme(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SettingCard extends StatefulWidget {
  final String lableName;
  final IconData iconName;
  final Widget widgetName;

  const SettingCard(
      {Key? key,
      required this.lableName,
      required this.iconName,
      required this.widgetName})
      : super(key: key);

  @override
  State<SettingCard> createState() => _SettingCardState();
}

class _SettingCardState extends State<SettingCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.widgetName),
        );
      },
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Card(
                      margin: EdgeInsets.zero,
                      color: kPrimaryColor,
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7.5),
                          child: Icon(
                            widget.iconName,
                            color: kLightColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.lableName,
                      style: const TextStyle(
                          color: kDarkColor,
                          fontFamily: "OpenSans",
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: kDarkColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
