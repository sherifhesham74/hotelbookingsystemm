import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/controllers/hotelsController.dart';
import 'package:hotelbooking/controllers/reservationsController.dart';
import 'package:hotelbooking/models/reservations.dart';
import 'package:hotelbooking/services/http/hotels_services.dart';
import 'package:hotelbooking/services/http/rooms_services.dart';
import 'package:hotelbooking/services/shared_prefs.dart';
import 'package:hotelbooking/ui/screens/hotelReview_Screen.dart';
import 'package:intl/intl.dart';

class BookingTileWidget extends StatefulWidget {
  const BookingTileWidget({Key? key, required this.reservation})
      : super(key: key);
  final Reservation reservation;

  @override
  _BookingTileWidgetState createState() => _BookingTileWidgetState();
}

class _BookingTileWidgetState extends State<BookingTileWidget> {
  HotelsController _hotelsController = Get.find();
  ReservationsController _reservationsController = Get.put(
      ReservationsController());

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery
          .of(context)
          .orientation == Orientation.portrait
          ? MediaQuery
          .of(context)
          .size
          .width
          : MediaQuery
          .of(context)
          .size
          .width * 0.7,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: MediaQuery
              .of(context)
              .orientation == Orientation.portrait
              ? 20
              : 0),
      decoration: BoxDecoration(
          color: Colors.indigo, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilder<ReservationsController>(
                    builder: (_) =>
                        FutureBuilder(
                            future: _hotelsController
                                .getHotelName(widget.reservation.roomid!),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                String hotelname = snapshot.data!;
                                return Text(
                                  '${hotelname}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                );
                              }
                              return CircularProgressIndicator(color: Colors
                                  .white,);
                            }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_sharp,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                          '${widget.reservation.startDate}  To  ${widget
                              .reservation.endDate}',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    'Cost : ${widget.reservation.cost} EGP',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rooms Number : ${widget.reservation.roomsNumber}',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                          color: Colors.white,
                          child: const Text(
                            'Review',
                            style: TextStyle(color: Colors.indigo),
                          ),
                          onPressed: () async {
                            int hotelid = await RoomsServices().getHotelId(
                                widget.reservation.roomid!);
                            int clientid = await SharedPrefs().getClientId();
                            Get.to(() =>
                                HotelReviewScreen(
                                    clientid: clientid, hotelid: hotelid));
                          }),
                      checkCancelation()

                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget checkCancelation() {
    print("here");
    print(widget.reservation.startDate);
    print(DateFormat("yyyy-mm-dd").parse(widget.reservation.startDate!).add(
        Duration(days: 90)));
    print(DateTime.now());
    if (DateFormat("yyyy-mm-dd").parse(widget.reservation.startDate!).add(
        Duration(days: 90)).isAfter(DateTime.now())) {

      return RaisedButton(

          color: Colors.red,
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            _reservationsController.cancelReservation(
                widget.reservation.reservationid!);
          });
    }
    else {
      return const Text(
        "no cancelation", style: TextStyle(color: Colors.white),);
    }
  }
}
