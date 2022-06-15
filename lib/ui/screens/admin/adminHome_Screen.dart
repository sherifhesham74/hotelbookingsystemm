import 'package:flutter/material.dart';
import 'package:hotelbooking/models/hotels.dart';
import 'package:hotelbooking/services/http/hotels_services.dart';
import 'package:hotelbooking/ui/screens/admin/addHotel_Screen.dart';
import 'package:hotelbooking/ui/widgets/hotelTile_Widget.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: FutureBuilder(
          future: HotelsServices().getAllHotels(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Hotel> hotels = snapshot.data;
              return ListView.builder(
                  itemCount: hotels.length,
                  itemBuilder: (context, int index) {
                    return hotelTileWidget(hotel: hotels[index]);
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      )),
      floatingActionButton: SizedBox(
        width: 150,
        height: 50,
        child: FloatingActionButton(
          backgroundColor: Colors.indigo,
          child: Text("Add hotel"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          onPressed: () {
           Get.to(AddHotelScreen());
          },
        ),
      ),

    );
  }
}
