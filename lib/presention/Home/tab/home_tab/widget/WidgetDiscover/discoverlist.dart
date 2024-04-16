import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/routes_manager.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/discoverveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/genreveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetDiscover/discoverwidget.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetGenre/genrewidget.dart';

class DiscoverLitWidget extends StatefulWidget {
  DiscoverLitWidget({Key? key,this.id}) : super(key: key);
int? id;
  @override
  State<DiscoverLitWidget> createState() => _CategoriesLitWidgetState();
}

class _CategoriesLitWidgetState extends State<DiscoverLitWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<DiscoverViewModel>().GetDiscover(widget.id??0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiscoverViewModel, HoomeTabStates>(
      buildWhen: (prevState, currentState) {
        if (currentState is HoomeTabLoadingState ||
            currentState is HoomeTabErrorState) {
          return false;
        }
        return true;
      },
      listenWhen: (prev, currentState) {
        if (currentState is HoomeTabLoadingState ||
            currentState is HoomeTabErrorState ||
            currentState is HoomeTabSuccessState) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is HoomeTabLoadingState) {
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
        if (state is HoomeTabErrorState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.error),
              );
            },
          );
        }
        if (state is HoomeTabSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is HoomeTabSuccessState) {
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
                      return InkWell(onTap: () {
                        Navigator.pushNamed(
                            context,
                            RoutesManager.MoreDiscoverdetails,
                            arguments: state.categories[index]
                        );
                      },child: DiscoverWidget(dis: state.categories[index]));
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
