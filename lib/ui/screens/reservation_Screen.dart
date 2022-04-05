import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/controllers/reservationsController.dart';
import 'package:hotelbooking/controllers/hotelsController.dart';
import 'package:hotelbooking/controllers/roomsController.dart';
import 'package:hotelbooking/models/reservations.dart';
import 'package:hotelbooking/services/http/hotels_services.dart';
import 'package:hotelbooking/ui/screens/reservationDetails_Screen.dart';
import 'package:hotelbooking/ui/widgets/roomTile_Widget.dart';
import '../../models/hotels.dart';
import '../widgets/datePicker_Widget.dart';
import 'package:hotelbooking/models/rooms.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key, required this.hotel}) : super(key: key);
  final Hotel hotel;

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  TextEditingController _startDate = TextEditingController();
  TextEditingController _endDate = TextEditingController();
  TextEditingController _rooms = TextEditingController();
  HotelsController _hotelsController = Get.find();
  ReservationsController reservationController =
      Get.find();

   List<int> roomsNumber = [1,2,3,4];

  int val = 0;
  int _selectedroomNumber = 1;

  @override
  void initState() {
    // TODO: implement initState
    _hotelsController.getHotelRooms(widget.hotel.hotelid!);
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Choose your Options",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child:
                          DatePickerWidget(context, _startDate, 'Start Date'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: DatePickerWidget(context, _endDate, 'End Date')),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Choose number of rooms',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: double.infinity,
                        height: 50,
                        child: TextFormField(
                          controller: _rooms,
                          readOnly: true,
                          decoration: InputDecoration(
                            suffix: DropdownButton(
                                iconEnabledColor: Colors.blueAccent,
                                items: roomsNumber
                                    .map<DropdownMenuItem<String>>((item) =>
                                        DropdownMenuItem<String>(
                                            value: item.toString(),
                                            child: Text(item.toString())))
                                    .toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _rooms.text = newValue! +
                                        (int.parse(newValue) == 1
                                            ? ' Room'
                                            : ' Rooms');
                                    _selectedroomNumber = int.parse(newValue);
                                    if (kDebugMode) {
                                      print(_selectedroomNumber);
                                    }
                                  });
                                }),
                            hintText: '1 Room',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<HotelsController>(
                  builder:(_)=> Expanded(
                    child: ListView.builder(
                        itemCount: _hotelsController.hotelRooms.length,
                        itemBuilder: (BuildContext context, int index) {
                          return  _hotelsController.hotelRooms.isNotEmpty ? Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              RoomTileWidget(room:_hotelsController.hotelRooms[index]),
                              Container(
                                child: Radio(
                                    activeColor: Colors.indigo,
                                    value: index,
                                    groupValue: val,
                                    onChanged: (value) {
                                      setState(() {
                                        val = int.parse(value.toString());
                                      });
                                    }),
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: Offset(0, 1)),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ],
                          ): CircularProgressIndicator();
                        }),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: FloatingActionButton(
                    backgroundColor: Colors.indigo,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Reservation res = Reservation(
                            daysNumber: calculateNumofDays(
                                _startDate.text, _endDate.text),
                            startDate: _startDate.text,
                            endDate: _endDate.text,
                            roomsNumber: _selectedroomNumber,
                            hotelName: widget.hotel.name,
                            cost: _hotelsController.hotelRooms[val].cost *
                                _selectedroomNumber *
                                calculateNumofDays(
                                    _startDate.text, _endDate.text),
                            roomType: _hotelsController.hotelRooms[val].name);
                        Get.to( ()=>ReservationDetailsScreen(reservation: res) );
                      }
                    },
                    child: const Text('Complete Reservation'),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  calculateNumofDays(String startDate, String endDate) {
    DateTime start = DateTime.parse(startDate);
    DateTime end = DateTime.parse(endDate);
    int difference = end.difference(start).inDays;
    return difference;
  }


}
