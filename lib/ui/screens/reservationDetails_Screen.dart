import 'package:flutter/material.dart';
import 'package:hotelbooking/controllers/reservationsController.dart';
import 'package:hotelbooking/controllers/screensController.dart';
import 'package:hotelbooking/models/reservations.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/models/rooms.dart';
import 'package:hotelbooking/services/http/reservations_services.dart';
import 'package:hotelbooking/ui/screens/bookings_Screen.dart';

import '../../models/hotels.dart';
import 'home_Screen.dart';

class ReservationDetailsScreen extends StatefulWidget {
  const ReservationDetailsScreen({Key? key, required this.reservation,required this.hotel,required this.room})
      : super(key: key);
  final Reservation reservation;
  final Hotel hotel;
  final Room room;

  @override
  _ReservationDetailsScreenState createState() =>
      _ReservationDetailsScreenState();
}

class _ReservationDetailsScreenState extends State<ReservationDetailsScreen> {
  TextStyle style =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 19);
  ReservationsController _controller = Get.find();
  ScreensController _screensController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(top: 50, left: 50),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hotel : ' + widget.hotel.name,
                      style: style,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Start Date : ' + widget.reservation.startDate,
                      style: style,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'End Date : ' + widget.reservation.endDate,
                      style: style,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Room Type : ' + widget.room.name,
                      style: style,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Days : ' + widget.reservation.daysNumber.toString(),
                      style: style,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Cost : ' + widget.reservation.cost.toString() + ' EGP',
                      style: style,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.redAccent,
                      child: Text('Cancel',
                          style: TextStyle(color: Colors.white))),
                  RaisedButton(
                    onPressed: () {
                     // _controller.addReservation(widget.reservation);
                      ReservationsServices().postReservations(widget.reservation);
                      _screensController.navigateToBookings();
                      Get.offAll(() => HomeScreen());
                    },
                    color: Colors.white,
                    child: Text(
                      'Reserve',
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
