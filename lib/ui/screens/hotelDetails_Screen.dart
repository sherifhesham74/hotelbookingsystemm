import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotelbooking/services/ui_services.dart';

import '../../models/hotels.dart';

class HotelDetailsScreen extends StatefulWidget {
  const HotelDetailsScreen({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;

  @override
  _HotelDetailsScreenState createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
              child: Image.network(
                widget.hotel.imageUrl,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(1, 0)),
              ], color: Colors.white),
              margin: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.hotel.name,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Row(
                    children: UiServices().startsDisplay(widget.hotel.stars),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(1, 0)),
              ], color: Colors.white),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price for 1 Night',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'EGP ${widget.hotel.price}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(widget.hotel.lat, widget.hotel.lng),
                  zoom: 10,
                ),
               onMapCreated: (GoogleMapController googleMapController){
                  setState(() {
                    markers.add(Marker(markerId: MarkerId('1'),position: LatLng(widget.hotel.lat,widget.hotel.lng)));
                  });
               },
               markers: markers
              ),
            )
        ],
      ),
          )),
    );
  }
}
