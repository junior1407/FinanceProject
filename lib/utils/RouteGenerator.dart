import 'package:anime_finance/constants/strings.dart';
import 'package:anime_finance/modules/dashboard/MainPage.dart';
import 'package:anime_finance/modules/dashboard/screens/add_screen/AddTransactionScreen.dart';
import 'package:anime_finance/modules/testpage/TestPage.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print(settings);
    final args = settings.arguments;
    switch(settings.name) {
      case HOME_ROUTE:
        return MaterialPageRoute(builder: (context) => MainPage());
      case ADD_ROUTE:
        return MaterialPageRoute(builder: (context) => AddTransactionScreen());
      default:
        if (args is String) {
          return MaterialPageRoute(builder: (context) => TestPage(message: args,));
        }
        return MaterialPageRoute(builder: (context) => TestPage(message: "",));
    }
  }
}