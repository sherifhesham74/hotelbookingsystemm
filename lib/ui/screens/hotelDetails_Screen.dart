import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotelbooking/controllers/reviewsController.dart';
import 'package:hotelbooking/services/ui_services.dart';
import 'package:hotelbooking/ui/screens/reservation_Screen.dart';

import '../../models/hotels.dart';
import '../widgets/reviewTile_Widget.dart';

class HotelDetailsScreen extends StatefulWidget {
  const HotelDetailsScreen({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;

  @override
  _HotelDetailsScreenState createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  Set<Marker> markers = {};
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
              child: Image.network(
                'https://th.bing.com/th/id/R.8d28fda3b2e5cfc1f6019fcbae29f6d0?rik=0LyWuVZk3lVqiw&pid=ImgRaw&r=0',
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
                    children: UiServices().startsDisplay(5),
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
                    target: LatLng(30.0000, 31.00000),
                    zoom: 10,
                  ),
                  onMapCreated: (GoogleMapController googleMapController) {
                    setState(() {
                      markers.add(Marker(
                          markerId: MarkerId('1'),
                          position: LatLng(30.0000, 31.00000)));
                    });
                  },
                  markers: markers),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Reviews",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            GetBuilder<ReviewsController>(builder:(_){
              return _reviewsController.reviewsList.isNotEmpty
                  ? ListView.builder(
                shrinkWrap: true,
                  itemCount: _reviewsController.reviewsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ReviewTileWidget(_reviewsController.reviewsList[index]);
                  })
                  : const Center(
                child: CircularProgressIndicator(color: Colors.indigo,),
              );
            } )

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
