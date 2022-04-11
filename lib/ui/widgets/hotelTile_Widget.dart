import 'package:flutter/material.dart';
import 'package:hotelbooking/controllers/hotelsController.dart';
import 'package:hotelbooking/controllers/reviewsController.dart';
import 'package:hotelbooking/models/hotels.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/services/http/hotels_services.dart';
import 'package:hotelbooking/services/ui_services.dart';
import 'package:hotelbooking/ui/screens/hotelDetails_Screen.dart';
Widget hotelTileWidget(BuildContext context, Hotel hotel) {

 ReviewsController _reviewsController = Get.put(ReviewsController());
  return InkWell(
    onTap: (){
      _reviewsController.getHotelReviews(hotel.hotelid!);
      Get.to(HotelDetailsScreen(hotel: hotel));
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
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.network(
                'https://th.bing.com/th/id/R.8d28fda3b2e5cfc1f6019fcbae29f6d0?rik=0LyWuVZk3lVqiw&pid=ImgRaw&r=0',
                fit: BoxFit.fitWidth,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: UiServices().startsDisplay(5)
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.7),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10))),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "EGP ${hotel.price}",
                        style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    const TextSpan(
                        text: '  Per Night',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.white))
                  ])),
                )
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
                  hotel.name,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
                RichText(
                  text: TextSpan(children: [
                    const WidgetSpan(
                        child: Icon(
                      Icons.rate_review,
                      size: 15,
                      color: Colors.grey,
                    )),
                    TextSpan(
                        text: "${hotel.reviewsNumber} Reviews",
                        style: const TextStyle(color: Colors.grey))
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
