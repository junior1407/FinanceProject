import 'package:anime_finance/config/themes/AppTheme.dart';
import 'package:anime_finance/config/themes/AppThemeData.dart';
import 'package:anime_finance/constants/strings.dart';
import 'package:anime_finance/utils/RouteGenerator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
void main() {
  runApp(AppTheme(child: FinanceApp()));
}

class FinanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: HOME_ROUTE,
          theme: context.watch<AppThemeData>().materialTheme,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}