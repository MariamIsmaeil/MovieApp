import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/routes_manager.dart';
import 'package:movie_app/core/utils/strings_manager.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/recomendveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetRecomend/recowidget.dart';


class RecoLitWidget extends StatefulWidget {
  const RecoLitWidget({Key? key}) : super(key: key);

  @override
  State<RecoLitWidget> createState() => _CategoriesLitWidgetState();
}

class _CategoriesLitWidgetState extends State<RecoLitWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<RecoViewModel>().GetReco();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecoViewModel, HomeStates>(
      buildWhen: (prevState , currentState){
        print("build ${currentState}");
        if(currentState is HomeLoadingState || currentState is HomeErrorState){
          return false;
        }
        return true;
      },
      listenWhen: (prev , currentState){
        if(currentState is HomeLoadingState || currentState is HomeErrorState || currentState is HomeSuccessState){
          return true;
        }
        return false;
      },
      listener: (context, state) {
        print("Listen $state");
        if(state is HomeLoadingState){
          showDialog(context: context, builder:(context) {
            return AlertDialog(
              content: SizedBox(
                height: 50.h,
                child: Center(child: CircularProgressIndicator(),),
              ),
            );
          },);
        }
        if(state is HomeErrorState){
          showDialog(context: context, builder:(context) {
            return AlertDialog(
              content: Text(state.error),
            );
          },);
        }
        if(state is HomeSuccessState){
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        print(state);
        if(state is HomeSuccessState){
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 320.h,
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft,child: Text(StringsManager.NewReco,style:TextStyle(color: Colors.white,fontSize: 30.sp),)),
                  Expanded(
                    child: ListView.separated(
                      padding: REdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          InkWell(onTap: () {
                            Navigator.pushNamed(
                              context,
                              RoutesManager.MoreDetailrecomand,
                              arguments: {
                                'reco': state.cat[index],
                                'list': state.cat,
                              },
                            );
                          }, child: RecoWidget(reco: state.cat[index])),
                      itemCount: state.cat.length,
                      separatorBuilder: (BuildContext context, int index)=>SizedBox(width: 10.w),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(),));
      },
    );
  }
}
