import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/colors_manager.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(bodyMedium: TextStyle(color: ColorManager.primarycolor,fontSize: 18)),
    scaffoldBackgroundColor:Color(0xff121312),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: ColorManager.primarycolor,unselectedItemColor: Colors.white)
  );
}