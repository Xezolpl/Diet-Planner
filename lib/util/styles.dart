import 'package:flutter/material.dart';

///Standard, default theme
ThemeData standardTheme = ThemeData();

/*.copyWith(
  primaryColor: primary1,
  primaryColorDark: primaryDark1,
  accentColor: accent1,
  splashColor: splash1,
  dialogBackgroundColor: background2,
  scaffoldBackgroundColor: background2,
  bottomAppBarColor: primary1,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.green,
  ,
);
*/
Color primary1 = const Color(0xFF999999);
Color primaryDark1 = const Color(0xFF222128);
Color accent1 = const Color(0xFF65BFA6);
Color splash1 = const Color(0xFFF47663);
Color background1 = const Color(0xFFFAFAFA);

//Dark theme
ThemeData darkTheme = ThemeData.dark();

Color primary2 = const Color(0xFF222831);
Color primaryDark2 = const Color(0xFFeeeeee);
Color accent2 = const Color(0xFF00adb5);
Color splash2 = const Color(0xFFF47663);
Color background2 = const Color(0xFF393e46);

//Values
List<ThemeData> themes = [standardTheme, darkTheme];

final TextStyle captionStyle = TextStyle(color: Colors.grey[400]);
final TextStyle whiteBody = TextStyle(color: Colors.white);
