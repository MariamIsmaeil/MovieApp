import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domain/entity/discoverentity/Discoverentity.dart';

class DiscoverWidget extends StatelessWidget {
  final Discoverentity dis;
  final String baseURL = "https://image.tmdb.org/t/p/w500";

  DiscoverWidget({super.key, required this.dis});

  @override
  Widget build(BuildContext context) {
    String imageUrl = (dis.posterPath?.startsWith('http') ?? false)
        ? dis.posterPath!
        : baseURL + (dis.posterPath ?? "");

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
            dis.title ?? "",
            maxLines: 2,
            style: TextStyle(color: Colors.white,fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),


        ],
      ),
    );
  }
}