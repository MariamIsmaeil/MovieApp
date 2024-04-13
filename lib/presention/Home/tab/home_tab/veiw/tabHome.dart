import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/DI/di.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/popularveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/popularlist.dart';

class tabHome extends StatelessWidget {
  const tabHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => getIt<PopularViewModel>(),
      child: Padding(
        padding: REdgeInsets.all(5.0),
        child: CustomScrollView(
          slivers: [
            PopularLitWidget(),
            SliverToBoxAdapter(child: SizedBox(height: 24.h,)),
          ],
        ),
      ),
    );
  }
  }


