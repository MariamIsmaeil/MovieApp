import 'package:flutter/material.dart';
import 'package:movie_app/config/theme/apptheme.dart';
import 'package:movie_app/core/utils/assets_manager.dart';
import 'package:movie_app/core/utils/colors_manager.dart';
import 'package:movie_app/core/utils/routes_manager.dart';
import 'package:movie_app/core/utils/strings_manager.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context,RoutesManager.homeRouteName);
    });
    return Scaffold(
      body: Column(
        children: [
           Expanded(flex: 3,child: Container(alignment: Alignment.center,child: Image(image: AssetImage(AssetsManager.splash)))),
          Expanded(flex: 1,
            child: Container(alignment: Alignment.bottomCenter,
              child: Column(children: [
                Image(image: AssetImage(AssetsManager.splash2)),
                Text(StringsManager.namesplash,style:Theme.of(context).textTheme.bodyMedium,)],),
            ),
          )
        ],
      ),
      );
  }

  }
