import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/ui/widgets/roomTile_Widget.dart';
import '../widgets/datePicker_Widget.dart';
import 'package:hotelbooking/models/rooms.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  TextEditingController _startDate = TextEditingController();
  TextEditingController _endDate = TextEditingController();
  TextEditingController _rooms = TextEditingController();

  List<int> rooms = [1, 2, 3, 4];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
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
                    child: DatePickerWidget(context, _startDate, 'Start Date'),
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
                  Text(
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
                      child: TextField(
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
                                });
                              }),
                          hintText: '1 Room',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: listofRooms.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RoomTileWidget(room: listofRooms[index],);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
