import 'package:flutter/material.dart';

import '../../../../../domain/entity/recomendentity/Recomendentity.dart';
import '../widget/WidgetWatchlist/WatchList.dart';

class tabWatchlist extends StatefulWidget {
  const tabWatchlist({super.key});

  @override
  State<tabWatchlist> createState() => _tabWatchlistState();
}
class _tabWatchlistState extends State<tabWatchlist> {
  List<Recomendentity> wishlist = [];

  // Function to add a movie to the wishlist
  void onAddToWishlist(Recomendentity reco) {
    setState(() {
      wishlist.add(reco);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: wishlist.isEmpty
          ? Center(child: EmptyWatchlist())
          : ListView.builder(
            itemCount: wishlist.length,
            itemBuilder: (context, index) {
            final Recomendentity = wishlist[index];}
          ),
      );
  }
}
