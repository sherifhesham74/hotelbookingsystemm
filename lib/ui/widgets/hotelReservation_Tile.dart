import 'package:flutter/material.dart';
import 'package:hotelbooking/models/rooms.dart';
import 'package:hotelbooking/services/http/clients_services.dart';
import 'package:hotelbooking/services/http/rooms_services.dart';
import 'package:intl/intl.dart';

import '../../controllers/hotelsController.dart';
import '../../controllers/reservationsController.dart';
import '../../models/reservations.dart';
import 'package:get/get.dart';

class HotelReservationTile extends StatefulWidget {
  const HotelReservationTile({Key? key, required this.reservation})
      : super(key: key);
  final Reservation reservation;

  @override
  _HotelReservationTileState createState() => _HotelReservationTileState();
}

class _HotelReservationTileState extends State<HotelReservationTile> {
  HotelsController _hotelsController = Get.find();
  ReservationsController _reservationsController =
      Get.put(ReservationsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: MediaQuery.of(context).orientation == Orientation.portrait
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
                    builder: (_) => FutureBuilder(
                        future: getClientName(widget.reservation.clientid!),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            String clientname = snapshot.data!;
                            return Text(
                              '${clientname}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500),
                            );
                          }
                          return CircularProgressIndicator(
                            color: Colors.white,
                          );
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
                          '${widget.reservation.startDate}  To  ${widget.reservation.endDate}',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                      future: getRoomName(widget.reservation.roomid!),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          String roomname = snapshot.data!;
                          return Text(
                            '${roomname}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          );
                        }
                        return CircularProgressIndicator(
                          color: Colors.white,
                        );
                      }),
                  const SizedBox(
                    height: 10,
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
                    children: [checkCancelation()],
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
    if (DateFormat("yyyy-mm-dd")
        .parse(widget.reservation.startDate!)
        .add(Duration(days: 120))
        .isAfter(DateTime.now())) {
      print('start date is');
      print(DateFormat("yyyy-mm-dd").parse(widget.reservation.startDate!));
      print(widget.reservation.startDate);
      print(DateTime.now());
      return RaisedButton(
          color: Colors.red,
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            _reservationsController
                .cancelReservationByHotel(widget.reservation.reservationid!);
          });
    } else {
      return const Text(
        "no cancelation",
        style: TextStyle(color: Colors.white),
      );
    }
  }

  getClientName(int clientid) async {
    String name = await ClientsServices().getuserNamebyId(clientid);
    return name;
  }

  getRoomName(int roomid) async {
    Room room = await RoomsServices().getRoomById(roomid);
    return room.name;
  }
}
