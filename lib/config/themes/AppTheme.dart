import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppThemeData.dart';

class AppTheme extends StatelessWidget {
  final Widget child;

  AppTheme({required this.child});

  @override
  Widget build(BuildContext context) {
    final themeData = AppThemeData(context);
    return Provider.value(value: themeData, child: child);
  }
}