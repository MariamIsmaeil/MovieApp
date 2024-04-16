import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/DI/di.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/genreveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetGenre/genrelist.dart';

class tabBrowse extends StatelessWidget {
  const tabBrowse({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GenreViewModel>(),
      child: Padding(
        padding: REdgeInsets.all(20.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 50.h,)),
            BlocProvider(create: (BuildContext context)=>getIt<GenreViewModel>(),
                child: GenreLitWidget()),

          ],
        ),
      ),
    );
  }
}

