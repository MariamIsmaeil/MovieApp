import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/strings_manager.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/similarbloc.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetSimilar/similarwidget.dart';

class SimilarLitWidget extends StatefulWidget {

   SimilarLitWidget({Key? key,this.index}) : super(key: key);
  int? index;
  @override
  State<SimilarLitWidget> createState() => _CategoriesLitWidgetState();
}

class _CategoriesLitWidgetState extends State<SimilarLitWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SimilarVeiwModel>().Getsimi(widget.index??0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarVeiwModel, HomesStates>(
      buildWhen: (prevState, currentState) {
        if (currentState is HomesLoadingState ||
            currentState is HomesErrorState) {
          return false;
        }
        return true;
      },
      listenWhen: (prev, currentState) {
        if (currentState is HomesLoadingState ||
            currentState is HomesErrorState ||
            currentState is HomesSuccessState) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is HomesLoadingState) {
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
        if (state is HomesErrorState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.error),
              );
            },
          );
        }
        if (state is HomesSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is HomesSuccessState) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 250.h, // Set the height of the ListView
              child: Container(color: Colors.black38,
                child: Column(
                  children: [
                    Align(alignment: Alignment.topLeft,child: Text(StringsManager.NewReleases,style:TextStyle(color: Colors.white,fontSize: 30.sp),)),
                    Expanded(
                      child: ListView.separated(
                        padding: REdgeInsets.all(10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            SimilarWidget( simi: state.cat[index]),
                        itemCount: state.cat.length,
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
