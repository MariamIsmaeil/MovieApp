import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domain/entity/search/Searchentity.dart';

class SearchWidget extends StatelessWidget {
  final Searchentity sa;
  final String baseURL = "https://image.tmdb.org/t/p/w500";

  SearchWidget({super.key, required this.sa});

  @override
  Widget build(BuildContext context) {
    String imageUrl = (sa.posterPath?.startsWith('http') ?? false)
        ? sa.posterPath!
        : baseURL + (sa.posterPath ?? "");

    return Container(color: Colors.grey,
      child: Column(
        children: [
          Expanded(flex: 4,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  errorWidget: (context, url, error) => Icon(Icons.error, size: 25.sp),
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,// Ensures the image covers the entire container proportionally
                ),
                Container( decoration: BoxDecoration
                  (image: DecorationImage(image: AssetImage("assets/images/Icon awesome-bookmark.png"),),),
                    child: Icon(Icons.add, color: Colors.white, size: 35.sp))
              ],
            ),
          ),
          Text(
            sa.title ?? "",
            maxLines: 2,
            style: TextStyle(color: Colors.white,fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),


        ],
      ),
    );
  }
}