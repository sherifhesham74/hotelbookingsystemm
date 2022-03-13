import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/controllers/reservationsController.dart';
import 'package:hotelbooking/models/reservations.dart';
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
  ReservationsController reservationController =
      Get.put(ReservationsController());

  List<int> rooms = [1, 2, 3, 4];
  int val = 0;
  int _selectedroomNumber = 1;
  final List<Room> listofRooms = [
    Room(
        name: "Standard",
        imageUrl:
            'https://th.bing.com/th/id/R.25b86c23a77f0e94d5e909cc1b3bceff?rik=Djcc7WwfZAnIjA&riu=http%3a%2f%2fcache.marriott.com%2fmarriottassets%2fmarriott%2fSTFCT%2fstfct-guestroom-0045-hor-clsc.jpg%3finterpolation%3dprogressive-bilinear%26&ehk=Qfi1Qy2RPsgQGGJQ%2bDLh1pnflcQlURsqEc584MAYrZI%3d&risl=&pid=ImgRaw&r=0',
        cost: 270,
        peopleCapacity: 2),
    Room(
        name: "Deluxe",
        imageUrl:
            'https://th.bing.com/th/id/R.28aea4f9dd03c96e50f7a2add474cf08?rik=hRk%2fMZ%2f886Kt2g&riu=http%3a%2f%2fd2e5ushqwiltxm.cloudfront.net%2fwp-content%2fuploads%2fsites%2f21%2f2016%2f06%2f21042553%2fExecutive-Room_23.jpg&ehk=MrNfToDML3o%2b5UCoiEz7vcVphQ2EfN%2f53YLJHvCJNCY%3d&risl=&pid=ImgRaw&r=0',
        cost: 400,
        peopleCapacity: 4),
  ];
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
                                items: rooms
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
                Expanded(
                  child: ListView.builder(
                      itemCount: listofRooms.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            RoomTileWidget(room: listofRooms[index]),
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
                        );
                      }),
                ),
                SizedBox(
                  width: 200,
                  child: FloatingActionButton(
                    backgroundColor: Colors.indigo,
                    onPressed: () {
                      Reservation res = Reservation(
                          daysNumber: calculateNumofDays(
                              _startDate.text, _endDate.text),
                          startDate: _startDate.text,
                          endDate: _endDate.text,
                          roomsNumber: _selectedroomNumber,
                          hotelName: widget.hotel.name,
                          cost: listofRooms[val].cost *
                              _selectedroomNumber *
                              calculateNumofDays(
                                  _startDate.text, _endDate.text),
                          roomType: listofRooms[val].name);
                      if (_formKey.currentState!.validate()) {
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
