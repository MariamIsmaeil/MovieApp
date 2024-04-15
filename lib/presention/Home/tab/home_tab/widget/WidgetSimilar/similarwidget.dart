import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domain/entity/similarentity/Similarentity.dart';

class SimilarWidget extends StatelessWidget {
  final Similarentity simi;
  final String baseURL = "https://image.tmdb.org/t/p/w500";

  SimilarWidget({super.key, required this.simi});

  @override
  Widget build(BuildContext context) {
    String imageUrl = (simi.posterPath?.startsWith('http') ?? false)
        ? simi.posterPath!
        : baseURL + (simi.posterPath ?? "");

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          errorWidget: (context, url, error) => Icon(Icons.error, size: 25.sp),
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          fit: BoxFit.cover, // Ensures the image covers the entire container proportionally
        ),
        simi.id!%2==0??false
            ? Container( decoration: BoxDecoration
          (image: DecorationImage(image: AssetImage("assets/images/Icon awesome-bookmark.png")),),child: Icon(Icons.add, color: Colors.white, size: 35.sp))
            : Container(decoration: BoxDecoration
          (image: DecorationImage(image: AssetImage("assets/images/Icon Yellow.png")),),
            child: Icon(Icons.check, color: Colors.white, size: 35.sp))
      ],
    );
  }
}