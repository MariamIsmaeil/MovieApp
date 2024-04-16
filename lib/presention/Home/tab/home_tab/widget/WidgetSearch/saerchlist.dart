import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/routes_manager.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/discoverveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/genreveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/searchveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetDiscover/discoverwidget.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetGenre/genrewidget.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetSearch/searchwidget.dart';

class SearchLitWidget extends StatefulWidget {
  SearchLitWidget({Key? key,this.text}) : super(key: key);
  String? text;
  @override
  State<SearchLitWidget> createState() => _CategoriesLitWidgetState();
}

class _CategoriesLitWidgetState extends State<SearchLitWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<SearchViewModel>().GetSearch(widget.text??"");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchViewModel, HoomesTabStates>(
      buildWhen: (prevState, currentState) {
        if (currentState is HoomesTabLoadingState ||
            currentState is HoomesTabErrorState) {
          return false;
        }
        return true;
      },
      listenWhen: (prev, currentState) {
        if (currentState is HoomesTabLoadingState ||
            currentState is HoomesTabErrorState ||
            currentState is HoomesTabSuccessState) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is HoomesTabLoadingState) {
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
        if (state is HoomesTabErrorState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.error),
              );
            },
          );
        }
        if (state is HoomesTabSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is HoomesTabSuccessState) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Container(
                  padding: EdgeInsets.all(10.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 25.h,
                      mainAxisSpacing: 25.w,
                    ),
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      return InkWell(onTap:() {
                        Navigator.pushNamed(
                            context,
                            RoutesManager.MoreSearchDetails,
                            arguments: state.categories[index]
                        );
                      },child: SearchWidget(sa: state.categories[index]));
                    },
                  ),
                );
              },
              childCount: 1,
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
