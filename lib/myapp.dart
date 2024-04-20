import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/DI/di.dart';
import 'package:movie_app/domain/entity/discoverentity/Discoverentity.dart';
import 'package:movie_app/domain/entity/popularentity/Popularentity.dart';
import 'package:movie_app/domain/entity/realseentity/Realserntity.dart';
import 'package:movie_app/domain/entity/recomendentity/Recomendentity.dart';
import 'package:movie_app/domain/entity/search/Searchentity.dart';
import 'package:movie_app/domain/entity/similarentity/Similarentity.dart';
import 'package:movie_app/presention/Home/homescreen.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiw/moredatailssearch.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiw/moredetails.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiw/moredetailsdiscover.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiw/moredetailsealase.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiw/moredetailsrecomand.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiw/moredetailssimilar.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiw/tabdiscover.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/bottomnavboc.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/recomendveiwmodel.dart';
import 'package:movie_app/splash/splash_screen.dart';
import 'package:movie_app/config/theme/apptheme.dart';
import 'package:movie_app/core/utils/routes_manager.dart';
import 'package:movie_app/domain/entity/genreentity/Genreentity.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        title: 'Flutter Demo',
        initialRoute: RoutesManager.splasheName,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case RoutesManager.splasheName:
              return MaterialPageRoute(builder: (_) => SplashScreen());
            case RoutesManager.homeRouteName:
              return MaterialPageRoute(builder: (_) => HomeScreen());
            case RoutesManager.MoreDetailsName:
              final popular = settings.arguments as Popularentity;
              return MaterialPageRoute(builder: (_) => MoreDetails(popular: popular,index: popular.id,));
            case RoutesManager.MoreDetailrelase:
              final Relse = settings.arguments as Realserntity;
              return MaterialPageRoute(builder: (_) => MoreDetailsRelse(relse: Relse,index: Relse.id,));
            case RoutesManager.MoreDetailrecomand:
              final Reco = settings.arguments as Recomendentity;
              return MaterialPageRoute(builder: (_) => MoreDetailsReco(reco: Reco,index: Reco.id,));
            case RoutesManager.MoreDetailSimilar:
              final simi = settings.arguments as Similarentity;
              return MaterialPageRoute(builder: (_) => MoreDetailsSimilar(simi: simi,index: simi.id,));

            case RoutesManager.MoreDiscover:
              final gen = settings.arguments as Genreentity;
              return MaterialPageRoute(builder: (_) => tabDiscover(index: gen.id, gen: gen,));



            case RoutesManager.MoreDiscoverdetails:
              final dis = settings.arguments as Discoverentity;
              return MaterialPageRoute(builder: (_) => MoreDetailsDiscover(index: dis.id, dis: dis,));


            case RoutesManager.MoreSearchDetails:
              final sa = settings.arguments as Searchentity;
              return MaterialPageRoute(builder: (_) => MoreDetailsSearch(index: sa.id, sa: sa,));

            default:
              return MaterialPageRoute(builder: (_) => SplashScreen());
          }
        },
      ),
    );
  }
}
