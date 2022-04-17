import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/models/hotels.dart';
import 'package:hotelbooking/models/reservations.dart';
import 'package:hotelbooking/services/http/hotels_services.dart';
import 'package:hotelbooking/services/http/reservations_services.dart';
import 'package:hotelbooking/services/shared_prefs.dart';
class ReservationsController extends GetxController{
  List<Reservation> reservationsList = [];
  List<Reservation> hotelreservations = <Reservation>[];

  getHotelReservation(Future<int> id)async{

    List<Reservation> returnedlist = await HotelsServices().getHotelReservations(await id);
    if(returnedlist.isNotEmpty){
      hotelreservations = returnedlist;
    }
    else{
      reservationsList = [];
    }
    update();
  }

 getReservation(Future<int> id)async{

   List<Reservation> returnedlist = await ReservationsServices().getClientReservations(await id);
   if(returnedlist.isNotEmpty){
     reservationsList = returnedlist;
   }
   else{
     reservationsList = [];
   }
   update();
 }

 cancelReservation(int reservationid)async{
   await ReservationsServices().cancelReservation(reservationid);
   Future<int> clientid =  SharedPrefs().getClientId();
   getReservation(clientid);
 }

  cancelReservationByHotel(int reservationid)async{
    await ReservationsServices().cancelReservation(reservationid);
    Future<int> clientid =  SharedPrefs().getClientId();
    getHotelReservation(clientid);
  }
}