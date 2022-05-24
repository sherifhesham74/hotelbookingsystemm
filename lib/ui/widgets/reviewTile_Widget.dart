import 'package:flutter/material.dart';
import 'package:hotelbooking/models/reviews.dart';


Widget ReviewTileWidget(Review review){

  return Container(
    decoration: BoxDecoration(
      color: review.happiness == "happy" ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(review.username!, style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 20),),
        const Divider(),
        Text(review.description, style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold)),
      ],
    ),
  );
}