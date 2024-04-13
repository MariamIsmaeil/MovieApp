import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domain/entity/popularentity/Popularentity.dart';

class MoreDetails extends StatelessWidget {
  final Popularentity popular;

  const MoreDetails({Key? key, required this.popular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          popular.title ?? "",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        "https://image.tmdb.org/t/p/w500/${popular.posterPath}",
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 300.h,
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.6),
                            ),
                            child: Icon(Icons.play_arrow, color: Colors.white, size: 80.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${popular.title ?? ""}",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.sp,color: Colors.white),
                      ),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${popular.releaseDate ?? ""}",
                        style: TextStyle(fontSize: 12,color: Colors.white),
                      ),
                      SizedBox(width: 15,),
                      Text(
                        "${popular.popularity  ?? ""}",
                        style: TextStyle(fontSize: 12,color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h,),
                  Row(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Image.network(
                              "https://image.tmdb.org/t/p/w500/${popular.posterPath}",
                              fit: BoxFit.cover,
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child:  Container(

                                    decoration: BoxDecoration
                                      (image: DecorationImage(image: AssetImage("assets/images/Icon awesome-bookmark.png")),),
                                    child: Icon(Icons.add,color: Colors.white,size: 35.sp,))
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        Text('''${popular.overview}'''??"",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white)),
                        Row(
                          children: [
                            Icon(Icons.star,color: Colors.amber,size: 24.sp,),
                            SizedBox(width: 10.w,),
                            Text("${popular.voteAverage}",style: TextStyle(color: Colors.white,fontSize: 24.sp)),
                          ],
                        )
                      ],)),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
