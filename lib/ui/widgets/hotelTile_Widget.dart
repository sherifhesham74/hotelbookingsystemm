import 'package:flutter/material.dart';
import 'package:hotelbooking/models/hotels.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/services/ui_services.dart';
import 'package:hotelbooking/ui/screens/hotelDetails_Screen.dart';
Widget hotelTileWidget(BuildContext context, Hotel hotel) {
  
  startsDisplay(){
    List<Widget> numOfStars = [];
    int stars = hotel.stars;
    while (stars != 0) {
      numOfStars.add(Icon(
        Icons.star,
        color: Colors.amber,
        size: 25,
      ));
      stars = stars - 1;
    }  
    return numOfStars;
  }
  
  
  return InkWell(
    onTap: (){
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
                hotel.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: UiServices().startsDisplay(hotel.stars)
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
                        text: "\$${hotel.price}",
                        style: const TextStyle(
                            fontSize: 20,
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
