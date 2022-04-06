import 'package:flutter/material.dart';
import 'package:hotelbooking/controllers/reservationsController.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/models/reservations.dart';
import 'package:hotelbooking/services/shared_prefs.dart';
import 'package:hotelbooking/ui/widgets/bookingTile_Widget.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({Key? key}) : super(key: key);

  @override
  _BookingsScreenState createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  ReservationsController _reservationsController = Get.put(ReservationsController());

  @override
  void initState() {
    // TODO: implement initState
    _reservationsController.getReservation(SharedPrefs().getClientId());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(

      margin: EdgeInsets.only(top: 20),
      child: GetBuilder<ReservationsController>(
        builder:(_)=> ListView.builder(itemCount: _reservationsController.reservationsList.length, itemBuilder:(BuildContext context, int index){
          return _reservationsController.reservationsList.isNotEmpty ? BookingTileWidget(reservation: _reservationsController.reservationsList[index]) : Center(
                            child: CircularProgressIndicator(),);
        }),
      )
    ));
  }
}
