import 'dart:convert';

import 'package:get/get.dart';
import 'package:hotelbooking/models/hotels.dart';
import 'package:hotelbooking/models/reservations.dart';
import 'package:hotelbooking/models/reviews.dart';
import 'package:hotelbooking/models/rooms.dart';
import 'package:hotelbooking/models/users.dart';
import 'package:hotelbooking/services/http/clients_services.dart';
import 'package:hotelbooking/services/http/rooms_services.dart';
import 'package:http/http.dart' as http;


class HotelsServices{
  final String url = ClientsServices().mainurl;

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

  getPositiveHotelReviews(int hotelid)async{
    final String path = 'http://$url/api/Reviews/Hotel/Happy?hotelid=$hotelid';

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

  getNegativeHotelReviews(int hotelid)async{
    final String path = 'http://$url/api/Reviews/Hotel/NotHappy?hotelid=$hotelid';

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

  addHotelReview(int clientid,int hotelid,String review)async{
    final String path = "http://$url/api/Reviews";
    Map<String,dynamic> body = {
      "hotelid" : "${hotelid}",
      "clientid" : "${clientid}",
      "review1" : "${review}"
    };

    final json = jsonEncode(body);
    final headers = {"Content-Type":"application/json"};
    http.Response response = await http.post(Uri.parse(path),body: json,headers: headers);
    if(response.statusCode == 200){
      return 'done';
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

  getHotelName(int id) async{
    int hotelid =  await RoomsServices().getHotelId(id);
    String hotelName = await ClientsServices().getuserNamebyId(hotelid);
    return hotelName;
  }

  getHotelReservations(int hotelid)async{
    final String path = 'http://$url/api/Reservations/hotel/$hotelid';
    http.Response response = await http.get(Uri.parse(path));
    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      List<Reservation> reservations = body.map((reservation) => Reservation.fromjson(reservation)).toList();
      return reservations;
    }

  }


  getAllHotels()async{
    final String path = 'http://$url/api/Users/Hotel';
    http.Response response = await http.get(Uri.parse(path));
    if(response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      List<Hotel> hotels = body.map((hotel) => Hotel.fromJson(hotel)).toList();
      return hotels;

    }
  }

  addHotel(Users user) async {
    final String path = "http://$url/api/Users";
    var json = {
      "role": "${user.role}",
      "name": "${user.name}",
      "password": "${user.password}",
      "email": '${user.email}',
      "photo": '${user.photo}',
      "address": "${user.address}",
      "phone" : "0",
      "lat" : "${user.lat}",
      "lng" : "${user.lng}"
    };
    var body = jsonEncode(json);
    print(body);
    try {
      http.Response response = await http.post(Uri.parse(path),
          body: body, headers: {"Content-Type": "application/json"});
      print(response.statusCode);
      var responseJson = jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

}