import 'package:flutter/material.dart';
import 'package:hotelbooking/models/reservations.dart';

class BookingTileWidget extends StatefulWidget {
  const BookingTileWidget({Key? key,required this.reservation}) : super(key: key);
  final Reservation reservation;

  @override
  _BookingTileWidgetState createState() => _BookingTileWidgetState();
}

class _BookingTileWidgetState extends State<BookingTileWidget> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * 0.2
          : 200,
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
                  Text(
                    '${widget.reservation.hotelName}',
                    style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w500),
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
                      Text('${widget.reservation.startDate}  To  ${widget.reservation.endDate}',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Days Number : ${widget.reservation.daysNumber}',style: TextStyle(color: Colors.white),),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Text(
                            'Cost : ${widget.reservation.cost} EGP',
                            style: TextStyle(color: Colors.white),
                          )))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
