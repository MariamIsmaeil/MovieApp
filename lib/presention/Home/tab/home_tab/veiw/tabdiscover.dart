import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/DI/di.dart';
import 'package:movie_app/domain/entity/genreentity/Genreentity.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/discoverveiwmodel.dart';

import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetDiscover/discoverlist.dart';

class tabDiscover extends StatefulWidget {
  final Genreentity gen;
  int? index;

  tabDiscover({Key? key, this.index,required this.gen}) : super(key: key);

  @override
  State<tabDiscover> createState() => _MoreDetailsSimilarState();
}

class _MoreDetailsSimilarState extends State<tabDiscover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(maxLines: 2,
            widget.gen.name ?? "",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocProvider(
          create: (context) => getIt<DiscoverViewModel>(),
          child: Padding(
            padding: REdgeInsets.all(10.0),
            child: CustomScrollView(
              slivers: [
                BlocProvider(create: (BuildContext context)=>getIt<DiscoverViewModel>(),
                    child: DiscoverLitWidget(id:widget.index ,)),

              ],
            ),
          ),
        )
    );
  }
}
