import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/routes_manager.dart';
import 'package:movie_app/core/utils/strings_manager.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/similarbloc.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetSimilar/similarwidget.dart';

class SimilarLitWidget extends StatefulWidget {
  final int? index;

  const SimilarLitWidget({Key? key, this.index}) : super(key: key);

  @override
  _SimilarLitWidgetState createState() => _SimilarLitWidgetState();
}

class _SimilarLitWidgetState extends State<SimilarLitWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<SimilarVeiwModel>().Getsimi(widget.index ?? 0);
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
                  height: 50,
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
              height: 350.h,
              child: Container(
                color: Colors.black38,
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          StringsManager.Similar,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.all(10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            InkWell(onTap:() {
                      Navigator.pushNamed(
                      context,
                      RoutesManager.MoreDetailSimilar,
                      arguments: state.cat[index]
                      );
                      },child: SimilarWidget(simi: state.cat[index])),
                        itemCount: state.cat.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(width: 25),
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
