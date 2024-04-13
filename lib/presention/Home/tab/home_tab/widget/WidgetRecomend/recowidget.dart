import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domain/entity/realseentity/Realserntity.dart';
import 'package:movie_app/domain/entity/recomendentity/Recomendentity.dart';

class RecoWidget extends StatelessWidget {
  final Recomendentity reco;
  final String baseURL = "https://image.tmdb.org/t/p/w500";

  RecoWidget({super.key, required this.reco});

  @override
  Widget build(BuildContext context) {
    String imageUrl = (reco.posterPath?.startsWith('http') ?? false)
        ? reco.posterPath!
        : baseURL + (reco.posterPath ?? "");

    return Container(
      child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    errorWidget: (context, url, error) => Icon(Icons.error, size: 25.sp),
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    fit: BoxFit.fill, // Ensures the image covers the entire container proportionally
                  ),
                  Container( decoration: BoxDecoration
                    (image: DecorationImage(image: AssetImage("assets/images/Icon awesome-bookmark.png")),),child: Icon(Icons.add, color: Colors.white, size: 35.sp))
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star,color: Colors.amber,size: 19),
                Text("${reco.voteAverage}",style: TextStyle(fontSize: 15,color: Colors.white),)
              ],
            ),
            Text(
              reco.title ?? "",
              maxLines: 3,
              style: TextStyle(color: Colors.white,fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            Text("${reco.releaseDate}",style: TextStyle(fontSize: 12,color: Colors.white),),


          ],
      ),
    );
  }
}