import 'package:flutter/material.dart';
import 'package:movie_app/presention/Home/homescreen.dart';

import '../../../../../../core/utils/routes_manager.dart';
class EmptyWatchlist extends StatefulWidget {
  const EmptyWatchlist({super.key});

  @override
  State<EmptyWatchlist> createState() => _EmptyWatchlistState();
}

class _EmptyWatchlistState extends State<EmptyWatchlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          SizedBox(height: 50,),
          Text("Watchlist",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 30),),
          Center(
            child: ElevatedButton(
              onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, "HomeScreen");
                  });
              },
            child: Text('Add to Wishlist'),
            ),

          ),
          ]),

        );
  }
}
