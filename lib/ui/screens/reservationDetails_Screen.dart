import 'package:flutter/material.dart';
import 'package:hotelbooking/controllers/reservationsController.dart';
import 'package:hotelbooking/controllers/screensController.dart';
import 'package:hotelbooking/models/reservations.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/ui/screens/bookings_Screen.dart';

import 'home_Screen.dart';

class ReservationDetailsScreen extends StatefulWidget {
  const ReservationDetailsScreen({Key? key, required this.reservation})
      : super(key: key);
  final Reservation reservation;

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
                      'Hotel : ' + widget.reservation.hotelName,
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
                      'Room Type : ' + widget.reservation.roomType,
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
                      _controller.addReservation(widget.reservation);
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
