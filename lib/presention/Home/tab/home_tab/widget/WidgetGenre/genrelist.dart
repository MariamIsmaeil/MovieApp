import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/routes_manager.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/genreveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetGenre/genrewidget.dart';

class GenreLitWidget extends StatefulWidget {
  GenreLitWidget({Key? key}) : super(key: key);

  @override
  State<GenreLitWidget> createState() => _CategoriesLitWidgetState();
}

class _CategoriesLitWidgetState extends State<GenreLitWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<GenreViewModel>().GetGenre();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenreViewModel, aHomeTabStates>(
      buildWhen: (prevState, currentState) {
        if (currentState is aHomeTabLoadingState ||
            currentState is aHomeTabErrorState) {
          return false;
        }
        return true;
      },
      listenWhen: (prev, currentState) {
        if (currentState is aHomeTabLoadingState ||
            currentState is aHomeTabErrorState ||
            currentState is aHomeTabSuccessState) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is aHomeTabLoadingState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: SizedBox(
                  height: 50.h,
                  child: Center(child: CircularProgressIndicator()),
                ),
              );
            },
          );
        }
        if (state is aHomeTabErrorState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.error),
              );
            },
          );
        }
        if (state is aHomeTabSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is aHomeTabSuccessState) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 1000.h,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Browse",style: TextStyle(fontSize: 40.sp,color: Colors.white)),
                      ],
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: REdgeInsets.all(2),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.h,
                          mainAxisSpacing: 10.w),
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          return InkWell(onTap: () {
                            Navigator.pushNamed(
                                context,
                                RoutesManager.MoreDiscover,
                                arguments: state.categories[index]
                            );
                          },child: GenreWidget(gen: state.categories[index]));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
