import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotelbooking/controllers/reviewsController.dart';
import 'package:hotelbooking/services/http/hotels_services.dart';
import 'package:hotelbooking/services/ui_services.dart';
import 'package:hotelbooking/ui/screens/reservation_Screen.dart';
import 'dart:io';
import '../../models/hotels.dart';
import '../../models/reviews.dart';
import '../widgets/reviewTile_Widget.dart';

class HotelDetailsScreen extends StatefulWidget {
  const HotelDetailsScreen({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;

  @override
  _HotelDetailsScreenState createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  Set<Marker> markers = {};

  bool rev = true;
  ReviewsController _reviewsController = Get.put(ReviewsController());

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
              child: Image.file(
                File.fromUri(Uri.parse(widget.hotel.imageUrl)),
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
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.hotel.lat!, widget.hotel.lng!),
                    zoom: 10,
                  ),
                  onMapCreated: (GoogleMapController googleMapController) {
                    setState(() {
                      markers.add(Marker(
                          markerId: MarkerId('1'),
                          position:
                              LatLng(widget.hotel.lat!, widget.hotel.lng!)));
                    });
                  },
                  markers: markers),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Reviews",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      rev = true;
                    });
                  },
                  child: Text("Positive"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    // background (button) color
                    onPrimary: Colors.white,
                    minimumSize: Size(110, 50),
                    shadowColor: Colors.grey,
                    side: BorderSide(color: Colors.black, width: rev ? 3 : 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30)), // foreground (text) color
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      rev = false;
                    });
                  },
                  child: Text("Negative"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    // background (button) color
                    onPrimary: Colors.white,
                    minimumSize: Size(110, 50),
                    shadowColor: Colors.grey,
                    side: BorderSide(color: Colors.black, width: rev ? 0 : 3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30)), // foreground (text) color
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.9,
                child: FutureBuilder(
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<Review> reviews = snapshot.data;
                        return ListView.builder(
                            itemCount: reviews.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ReviewTileWidget(reviews[index]);
                            });
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                    future: rev
                        ? HotelsServices()
                            .getPositiveHotelReviews(widget.hotel.hotelid!)
                        : HotelsServices()
                            .getNegativeHotelReviews(widget.hotel.hotelid!)),
              ),
            )
          ],
        ),
      )),
      floatingActionButton: SizedBox(
        width: 150,
        height: 50,
        child: FloatingActionButton(
          backgroundColor: Colors.indigo,
          child: Text("Reserve"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          onPressed: () {
            Get.to(() => ReservationScreen(
                  hotel: widget.hotel,
                ));
          },
        ),
      ),
    );
  }
}
