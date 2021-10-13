import 'package:flutter/material.dart';

class AppThemeData {
  final BorderRadius borderRadius = BorderRadius.circular(8);

  final Color selectedTabColor = Colors.pink;
  final Color unselectedTabColor = Colors.black26;
  final Color primaryColor = Color(0xFFFF3378);
  final Color coolBlack = Color(0xFF121829);
  AppThemeData(BuildContext context);
  ThemeData get materialTheme {
    Map<int, Color> map =
    {

      50:Color.fromRGBO(255,51,120, .1),
      100:Color.fromRGBO(255,51,120, .2),
      200:Color.fromRGBO(255,51,120, .3),
      300:Color.fromRGBO(255,51,120, .4),
      400:Color.fromRGBO(255,51,120, .5),
      500:Color.fromRGBO(255,51,120, .6),
      600:Color.fromRGBO(255,51,120, .7),
      700:Color.fromRGBO(255,51,120, .8),
      800:Color.fromRGBO(255,51,120, .9),
      900:Color.fromRGBO(255,51,120, 1),
    };
    return ThemeData(
      fontFamily: "GTWalsheim",
        primarySwatch: MaterialColor(0xFFFF3378, map),
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor
        ),
        primaryTextTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.green),
          bodyText2: TextStyle(color: Colors.grey),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.white
        ),
        brightness: Brightness.light,
        accentColor: Colors.pink,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor
      ),
    );
  }
}