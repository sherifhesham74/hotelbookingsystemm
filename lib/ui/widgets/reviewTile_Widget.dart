import 'package:flutter/material.dart';
import 'package:hotelbooking/models/reviews.dart';
import 'package:hotelbooking/services/http/clients_services.dart';


Widget ReviewTileWidget(Review review){
 print(review.username);
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
        FutureBuilder(
          future: ClientsServices().getuserNamebyId(review.userid!),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              String name = snapshot.data;
              return Text(name, style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 20),);
            }
            else{
            return Text('', style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 20),);
            }
          },
        ),

        const Divider(),
        Text(review.description, style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold)),
      ],
    ),
  );
}