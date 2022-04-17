import 'package:flutter/material.dart';
import 'package:hotelbooking/models/reviews.dart';
import 'package:hotelbooking/services/http/hotels_services.dart';
import 'package:hotelbooking/ui/widgets/reviewTile_Widget.dart';

import '../../../services/shared_prefs.dart';

class HotelReviewsScreenH extends StatefulWidget {
  const HotelReviewsScreenH({Key? key}) : super(key: key);

  @override
  _HotelReviewsScreenHState createState() => _HotelReviewsScreenHState();
}

class _HotelReviewsScreenHState extends State<HotelReviewsScreenH> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(child: Container(
        child: FutureBuilder(
          future: getHotelReviews(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              List<Review> reviews = snapshot.data;
             return ListView.builder(itemCount: reviews.length,itemBuilder: (BuildContext context, int index){
               return ReviewTileWidget(reviews[index]);
              });
            }
            else{
              return Center(child : Text('No Reviews'));
            }
          },
        ),
      )),
    );
  }


  getHotelReviews()async{
    int hotelid = await SharedPrefs().getClientId();
    List<Review> reviews = await HotelsServices().getHotelReviews(hotelid);
    return reviews;
  }
}
