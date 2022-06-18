import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/controllers/reservationsController.dart';
import 'package:hotelbooking/models/reservations.dart';
import 'package:hotelbooking/ui/screens/hotelOwner/hotelProfile_Screen.dart';
import 'package:hotelbooking/ui/widgets/bookingTile_Widget.dart';
import 'package:hotelbooking/ui/widgets/hotelReservation_Tile.dart';
import '../../../controllers/hotelsController.dart';
import '../../../services/shared_prefs.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import '../login.dart';

class HotelReservationsScreen extends StatefulWidget {
  const HotelReservationsScreen({Key? key}) : super(key: key);

  @override
  _HotelReservationsScreenState createState() =>
      _HotelReservationsScreenState();
}

class _HotelReservationsScreenState extends State<HotelReservationsScreen> {
  DateTime _selectedate = DateTime.now();
  ReservationsController _reservationsController =
      Get.put(ReservationsController());

  HotelsController _hotelsController = Get.put(HotelsController());

  @override
  void initState() {
    // TODO: implement initState
    getHotelReservation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _dateBar(),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<ReservationsController>(
              builder:(_)=> Expanded(

                  child: ListView.builder(
                      itemCount:
                          _reservationsController.hotelreservations.length,
                      itemBuilder: (BuildContext context, int index){
                        Reservation res = _reservationsController.hotelreservations[index];
                        if(res.startDate == DateFormat("yyyy-mm-dd").parse(_selectedate.toString()).add(Duration(days: 150)).toString().substring(0, 10)){
                          return HotelReservationTile(reservation: res);
                         }
                         else{
                           return SizedBox(height: 0,);
                         }
                      }))
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: Text("Profile"),
        onPressed: () async {
          int hotelid = await SharedPrefs().getClientId();
          Get.to(() => HotelProfileScreen(
                hotelid: hotelid,
              ));
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

  getHotelReservation()async {
    Future<int> hotelid = SharedPrefs().getClientId();
    await _reservationsController.getHotelReservation(hotelid);
    print(_reservationsController.hotelreservations.length);
  }
}
