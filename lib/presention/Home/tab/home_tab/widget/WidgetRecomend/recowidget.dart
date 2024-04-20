import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domain/entity/realseentity/Realserntity.dart';
import 'package:movie_app/domain/entity/recomendentity/Recomendentity.dart';

import '../../veiw/tabWatchlist.dart';

class RecoWidget extends StatelessWidget {
  final Recomendentity reco;
  final VoidCallback onAddToWishlist;
  final String baseURL = "https://image.tmdb.org/t/p/w500";

  RecoWidget({Key? key, required this.reco, required this.onAddToWishlist})
      : super(key: key);

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
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, size: 25.sp),
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: onAddToWishlist, // Call the callback when tapped
                    child: Icon(Icons.add, color: Colors.white, size: 35.sp),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 19),
              Text(
                "${reco.voteAverage}",
                style: TextStyle(fontSize: 15, color: Colors.white),
              )
            ],
          ),
          Text(
            reco.title ?? "",
            maxLines: 3,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "${reco.releaseDate}",
            style: TextStyle(
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
