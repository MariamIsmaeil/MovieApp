import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domain/entity/realseentity/Realserntity.dart';

class RealseWidget extends StatelessWidget {
  final Realserntity realse;
  final String baseURL = "https://image.tmdb.org/t/p/w500";

  RealseWidget({super.key, required this.realse});

  @override
  Widget build(BuildContext context) {
    String imageUrl = (realse.posterPath?.startsWith('http') ?? false)
        ? realse.posterPath!
        : baseURL + (realse.posterPath ?? "");

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          errorWidget: (context, url, error) => Icon(Icons.error, size: 25.sp),
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          fit: BoxFit.fill, // Ensures the image covers the entire container proportionally
        ),
        realse.id!%2==0??false
        ? Container( decoration: BoxDecoration
          (image: DecorationImage(image: AssetImage("assets/images/Icon awesome-bookmark.png")),),child: Icon(Icons.add, color: Colors.white, size: 35.sp))
        : Container(decoration: BoxDecoration
          (image: DecorationImage(image: AssetImage("assets/images/Icon Yellow.png")),),
            child: Icon(Icons.check, color: Colors.white, size: 35.sp))
      ],
    );
  }
}