import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presention/Home/tab/home_tab/bottomhome.dart';
import 'package:movie_app/presention/Home/tab/home_tab/tabBrowse.dart';
import 'package:movie_app/presention/Home/tab/home_tab/tabHome.dart';
import 'package:movie_app/presention/Home/tab/home_tab/tabSearch.dart';
import 'package:movie_app/presention/Home/tab/home_tab/tabWatchlist.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/bottomnavboc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<Widget> tabs = [tabHome(),tabSearch(),tabBrowse(),tabWatchlist()];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (context, currentNavIndex) {
        return  Scaffold(
            body: tabs[currentNavIndex],
            bottomNavigationBar: BottomHome()
        );
      },
    );
  }
}
