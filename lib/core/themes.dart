import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Traditional',
  scaffoldBackgroundColor: Colors.white70.withOpacity(.92),
  appBarTheme: const AppBarTheme(
    titleSpacing: 0,
    backgroundColor: AppConstance.primaryColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 24,
    ),
    elevation: 0,
  ),
);
