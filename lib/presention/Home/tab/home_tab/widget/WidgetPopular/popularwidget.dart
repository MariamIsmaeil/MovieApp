import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domain/entity/popularentity/Popularentity.dart';

class PopularWidget extends StatelessWidget {
  final Popularentity popular;
  final String baseURL = "https://image.tmdb.org/t/p/w500";

  PopularWidget({super.key, required this.popular});

  @override
  Widget build(BuildContext context) {
    String imageUrl = (popular.posterPath?.startsWith('http') ?? false)
        ? popular.posterPath!
        : baseURL + (popular.posterPath ?? "");

    return Column(
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                errorWidget: (context, url, error) => Icon(Icons.error, size: 25.sp),
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                fit: BoxFit.fill, // Ensures the image covers the entire container proportionally
              ),
              Align(alignment: Alignment.center,child: Container(decoration: BoxDecoration
                (shape: BoxShape.circle, color: Colors.black.withOpacity(0.6),),
                  child: Icon(Icons.play_arrow,color: Colors.white,size: 80.sp,))),
              Positioned(
                left: 5.w,
                bottom: 5.h,
                child: Stack(
                  children:[ CachedNetworkImage(
                    imageUrl: imageUrl,
                    errorWidget: (context, url, error) => Icon(Icons.error, size: 10.sp),
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    width: 120.w, // Adjusted size for consistency
                    fit: BoxFit.cover, // Ensures the image covers the entire container proportionally
                  ),
                    Container(

                        decoration: BoxDecoration
                          (shape: BoxShape.circle, color: Colors.black.withOpacity(0.6),),
                        child: Icon(Icons.add,color: Colors.white,size: 35.sp,))
                ]
                ),
              ),
            ],
          ),
        ),
        Text(
          popular.title ?? "",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
