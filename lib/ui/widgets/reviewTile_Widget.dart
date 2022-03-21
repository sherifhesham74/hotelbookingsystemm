import 'package:flutter/material.dart';
import 'package:hotelbooking/models/reviews.dart';


Widget ReviewTileWidget(Review review){

  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(review.username!, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple,fontSize: 20),),
        Text(review.description, style: TextStyle(color: Colors.black54,fontSize: 15))
      ],
    ),
  );
}