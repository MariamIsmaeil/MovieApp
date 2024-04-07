
import 'package:flutter/material.dart';
import 'package:movie_app/presention/Home/homescreen.dart';

import 'config/theme/apptheme.dart';
import 'core/utils/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      title: 'Flutter Demo',
      routes: {
        RoutesManager.homeRouteName:(_)=>HomeScreen()
      },
      initialRoute:RoutesManager.homeRouteName ,

    );
  }
}
