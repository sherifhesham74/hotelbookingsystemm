import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/models/hotels.dart';
import 'package:hotelbooking/services/http/hotels_services.dart';

import '../models/rooms.dart';

class HotelsController extends GetxController {
  List<Hotel> hotelsList = [];
  List<Room> hotelRooms = [];

  getHotels(String city) async {
    List<Hotel> returnedList = await HotelsServices().getHotelByCity(city);
    if (returnedList.isEmpty) {
      hotelsList = [];
    } else {
      hotelsList = returnedList;
    }
    update();
  }

  getHotelRooms(int id) async{
    List<Room> returnedList = await HotelsServices().getHotelRooms(id);
    if(returnedList.isEmpty){

      hotelRooms = [];
    }
    else{
      hotelRooms = returnedList;
    }
    update();
  }

  getHotelName(int roomid)async{
   String HotelName = await HotelsServices().getHotelName(roomid);
    return HotelName;
  }
}
