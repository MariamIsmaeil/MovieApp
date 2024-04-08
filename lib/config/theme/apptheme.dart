import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/colors_manager.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(bodyMedium: TextStyle(color: ColorManager.primarycolor,fontSize: 18))
    );
}