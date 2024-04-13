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
        Container(
            decoration: BoxDecoration
              (shape: BoxShape.circle, color: Colors.black.withOpacity(0.6),),
            child: realse.adult??false
            ? Icon(Icons.check, color: Colors.white, size: 35.sp)
            : Icon(Icons.add, color: Colors.white, size: 35.sp),
        ),
      ],
    );
  }
}
