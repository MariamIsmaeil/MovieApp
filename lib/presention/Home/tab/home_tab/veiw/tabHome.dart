import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/DI/di.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/popularveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/realseveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/recomendveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetPopular/popularlist.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetRecomend/recolist.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetRelase/realselist.dart';

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
             BlocProvider(create: (BuildContext context)=>getIt<RealseViewModel>(),
             child: RealseLitWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 1.h,)),
            BlocProvider(create: (BuildContext context)=>getIt<RecoViewModel>(),
                child: RecoLitWidget()),

          ],
        ),
      ),
    );
  }
  }


