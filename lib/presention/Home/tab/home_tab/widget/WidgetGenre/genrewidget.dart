import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domain/entity/genreentity/Genreentity.dart';
import 'package:movie_app/domain/entity/popularentity/Popularentity.dart';

class GenreWidget extends StatelessWidget {
  final Genreentity gen;

  GenreWidget({super.key, required this.gen});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
Image(image: AssetImage("assets/images/0e34a5e080e8c915030603ddcdb4eeba.png"),fit: BoxFit.fitHeight),
              Align(alignment: Alignment.center,child: Container(decoration: BoxDecoration
                (shape: BoxShape.circle, color: Colors.black.withOpacity(0.6),),
                  child: Text(gen.name??"",style: TextStyle(color: Colors.white,fontSize: 25.sp),))),
            ],
          ),
        ),
      ],
    );
  }
}
