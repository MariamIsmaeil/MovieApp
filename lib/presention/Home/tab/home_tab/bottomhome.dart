import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/strings_manager.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/bottomnavboc.dart';


class BottomHome extends StatelessWidget {
  const BottomHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (context, currentNavIndex) {
        return BottomNavigationBar(
          onTap: (index) {
            context.read<BottomNavBarCubit>().changeTab(index);
          },
          currentIndex: currentNavIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: StringsManager.bottomnav1,
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.search, size: 30),
              label: StringsManager.bottomnav2,
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.open_in_browser, size: 30),
              label: StringsManager.bottomnav3,
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.view_list, size: 30),
              label: StringsManager.bottomnav4,
            ),
          ],
        );
      },
    );
  }
}
