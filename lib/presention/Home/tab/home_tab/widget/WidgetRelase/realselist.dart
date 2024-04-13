import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/config/theme/apptheme.dart';
import 'package:movie_app/core/utils/strings_manager.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/realseveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetRelase/realsewidget.dart';

class RealseLitWidget extends StatefulWidget {
  const RealseLitWidget({Key? key}) : super(key: key);

  @override
  State<RealseLitWidget> createState() => _CategoriesLitWidgetState();
}

class _CategoriesLitWidgetState extends State<RealseLitWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<RealseViewModel>().GetRealse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RealseViewModel, HomeTabsStates>(
      buildWhen: (prevState, currentState) {
        if (currentState is HomeTabsLoadingState ||
            currentState is HomeTabsErrorState) {
          return false;
        }
        return true;
      },
      listenWhen: (prev, currentState) {
        if (currentState is HomeTabsLoadingState ||
            currentState is HomeTabsErrorState ||
            currentState is HomeTabsSuccessState) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is HomeTabsLoadingState) {
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
        if (state is HomeTabsErrorState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.error),
              );
            },
          );
        }
        if (state is HomeTabsSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is HomeTabsSuccessState) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 300.h, // Set the height of the ListView
              child: Container(color: Colors.black38,
                child: Column(
                  children: [
                    Align(alignment: Alignment.topLeft,child: Text(StringsManager.NewReleases,style:TextStyle(color: Colors.white,fontSize: 30.sp),)),
                    Expanded(
                      child: ListView.separated(
                        padding: REdgeInsets.all(10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            RealseWidget(realse: state.c[index]),
                        itemCount: state.c.length,
                        separatorBuilder: (BuildContext context, int index)=>SizedBox(width: 25.w),
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
