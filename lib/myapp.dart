import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presention/Home/homescreen.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/bottomnavboc.dart';
import 'package:movie_app/splash/splash_screen.dart';

import 'config/theme/apptheme.dart';
import 'core/utils/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        title: 'Flutter Demo',
        routes: {
          RoutesManager.splasheName: (_) => SplashScreen(),
          RoutesManager.homeRouteName: (_) => HomeScreen()
        },
        initialRoute: RoutesManager.splasheName,
      ),
    );
  }
}
