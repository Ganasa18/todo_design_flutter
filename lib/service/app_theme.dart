import 'package:flutter/material.dart';
import 'package:my_todo_test/static/static_data.dart';

enum AppTheme { lightTheme, darkTheme }

final appThemeData = {
  // DARK THEME
  AppTheme.darkTheme: ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Constants.colorBg,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: const IconThemeData(color: Constants.colorWhite),
  ),

  // LIGTH THEME
  AppTheme.lightTheme: ThemeData(
    // primarySwatch: Colors.grey,
    // primaryColor: Colors.white,
    scaffoldBackgroundColor: Constants.colorWhite,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: const IconThemeData(color: Constants.colorOrange),
  ),
};
