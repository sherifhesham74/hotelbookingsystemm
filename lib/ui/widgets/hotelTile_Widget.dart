import 'package:flutter/material.dart';
import 'package:hotelbooking/controllers/hotelsController.dart';
import 'package:hotelbooking/controllers/reviewsController.dart';
import 'package:hotelbooking/models/hotels.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/models/reviews.dart';
import 'package:hotelbooking/services/http/hotels_services.dart';
import 'package:hotelbooking/services/ui_services.dart';
import 'package:hotelbooking/ui/screens/hotelDetails_Screen.dart';
import 'dart:io';

class hotelTileWidget extends StatefulWidget {
  const hotelTileWidget({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;

  @override
  _hotelTileWidgetState createState() => _hotelTileWidgetState();
}

class _hotelTileWidgetState extends State<hotelTileWidget> {
  ReviewsController _reviewsController = Get.put(ReviewsController());


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _reviewsController.getHotelReviews(widget.hotel.hotelid!);
        Get.to(HotelDetailsScreen(hotel: widget.hotel));
      },
      child: Container(
        margin: EdgeInsets.all(40),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 1)),
            ],
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.file(
                  File.fromUri(Uri.parse(widget.hotel.imageUrl)),
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder(
                      future: getHotelRate(widget.hotel.hotelid!),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          int rate = snapshot.data;
                          return Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.7),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10))),
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                "Rate %${rate}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ));
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),

                ],
              )
            ]),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    widget.hotel.name,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                  FutureBuilder(
                    future: HotelsServices().getHotelReviews(widget.hotel.hotelid!),
                    builder:(BuildContext context, AsyncSnapshot snapshot){
                      if(snapshot.hasData){
                        List<Review> reviews = snapshot.data;
                        return RichText(
                          text: TextSpan(children: [
                            const WidgetSpan(
                                child: Icon(
                                  Icons.rate_review,
                                  size: 15,
                                  color: Colors.grey,
                                )),
                            TextSpan(
                                text: "${reviews.length} Reviews",
                                style: const TextStyle(color: Colors.grey))
                          ]),
                        );
                      }
                      else{
                        return Text("0");
                      }
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getHotelRate(int hotelId) async {
    List<Review> reviewsList = await HotelsServices().getHotelReviews(hotelId);
    List<Review> dummyList = reviewsList;
    int rate = 0;
    int positive = 0;
    int negative = 0;
    for (int i = 0; i < dummyList.length; i++) {
      if (dummyList[i].happiness == "happy") {
        positive++;
      } else {
        negative++;
      }
    }
    if (positive != 0 && negative != 0) {
      rate = ((positive / (positive + negative)) * 100).toInt();
      return rate;
    }
  }
}
