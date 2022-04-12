import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/ui/screens/hotelOwner/hotelProfile_Screen.dart';
import '../../../services/shared_prefs.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import '../login.dart';

class HotelReservationsScreen extends StatefulWidget {
  const HotelReservationsScreen({Key? key}) : super(key: key);

  @override
  _HotelReservationsScreenState createState() => _HotelReservationsScreenState();
}

class _HotelReservationsScreenState extends State<HotelReservationsScreen> {
  DateTime _selectedate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              _dateBar(),
            ],
          ),
        )
      ),
          floatingActionButton: FloatingActionButton(
            child: Text("Profile"),
            onPressed: ()async{
              int hotelid = await SharedPrefs().getClientId();
              Get.to(()=>HotelProfileScreen(hotelid: hotelid,));
            },
          ),
    );
  }
  Widget _dateBar() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: DatePicker(
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        onDateChange: (newDate) {
          setState(() {
            _selectedate = newDate;
          });
        },
        width: 70,
        height: 100,
        selectedTextColor: Colors.white,
        selectionColor: Colors.indigo,
        dayTextStyle:
        TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
        dateTextStyle: TextStyle(
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        monthTextStyle:
        TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }
}
