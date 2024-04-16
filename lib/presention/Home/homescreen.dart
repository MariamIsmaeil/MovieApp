import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiw/bottomhome.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiw/tabBrowse.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiw/tabHome.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiw/tabSearch.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiw/tabWatchlist.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/bottomnavboc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<Widget> tabs = [tabHome(),TabSearch(),tabBrowse(),tabWatchlist()];
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child)=>BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, currentNavIndex) {
          return  Scaffold(
              body: tabs[currentNavIndex],
              bottomNavigationBar: BottomHome()
          );
        },
      ),
    );
  }
}
