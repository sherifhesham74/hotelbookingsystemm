import 'dart:convert';

import 'package:get/get.dart';
import 'package:hotelbooking/models/hotels.dart';
import 'package:hotelbooking/models/reviews.dart';
import 'package:hotelbooking/models/rooms.dart';
import 'package:http/http.dart' as http;


class HotelsServices{
  final String url = '192.168.1.10:45455';

  getHotelByCity(String city)async{
    String path = '/api/Hotel/Address';
    final Hotelsurl = Uri.http(url, path,{"address":city});
    final headers = {"Content-Type":"application/json"};
    try{
      final response = await http.get(Hotelsurl,headers: headers);
      if(response.statusCode == 200){
        List<dynamic> body = jsonDecode(response.body);

        List<Hotel> hotels = await body.map((hotel) => Hotel.fromJson(hotel)).toList();
        if(hotels.isNotEmpty){
          return hotels;
        }
        else{
          return <Hotel>[];
        }
      }

    }
    catch(e){
      print(e);
    }
  }

  getHotelReviews(int id)async{
    final String path = 'http://$url/api/Reviews/Hotel?hotelid=$id';

    final response = await http.get(Uri.parse(path));
    try{
      if(response.statusCode == 200){
        List<dynamic> body = jsonDecode(response.body);
        List<Review> reviews = body.map((review) => Review.fromJson(review)).toList();
        return reviews;
      }
      else{
        return <Review>[];
      }
    }
    catch(e){
      print(e);
    }
  }

  getHotelRooms(int id)async{
    final String path = 'http://$url/api/Rooms/Hotel/${id}';
    http.Response response = await http.get(Uri.parse(path));
    print(response.statusCode);
    try{
      if(response.statusCode == 200){
        List<dynamic> body = jsonDecode(response.body);
        List<Room> rooms = body.map((room) => Room.fromJson(room)).toList();
        return rooms;
      }
    }
    catch(e){
      print(e);
    }
  }


}