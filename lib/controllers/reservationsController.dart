import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/models/hotels.dart';
import 'package:hotelbooking/models/reservations.dart';
class ReservationsController extends GetxController{
 final RxList reservationsList = <Reservation>[].obs;

 addReservation(Reservation reservation){
   reservationsList.add(reservation);
   if (kDebugMode) {
     print('Added');
     print(reservation.cost);
     print(reservation.daysNumber);
     print(reservation.roomType);
   }
 }
}