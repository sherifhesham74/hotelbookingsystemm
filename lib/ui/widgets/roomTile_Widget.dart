import 'package:flutter/material.dart';
import 'package:hotelbooking/models/rooms.dart';

class RoomTileWidget extends StatefulWidget {
  const RoomTileWidget({Key? key, required this.room}) : super(key: key);
  final Room room;

  @override
  _RoomTileWidgetState createState() => _RoomTileWidgetState();
}

class _RoomTileWidgetState extends State<RoomTileWidget> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1)),
      ], color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image.network(
            widget.room.imageUrl,
            fit: BoxFit.fitHeight,
          )),
          const SizedBox(
            width: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.room.name,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                    text: TextSpan(children: [
                  WidgetSpan(
                      child: Icon(
                    Icons.person,
                    size: 14,
                    color: Colors.indigo,
                  )),
                  TextSpan(
                      text: '${widget.room.peopleCapacity} People',
                      style: TextStyle(color: Colors.black87, fontSize: 11))
                ])),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  'EGP ${widget.room.cost}',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 19,
                      fontWeight: FontWeight.w400),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: clicked ? Colors.indigo : Colors.white,
                        side: BorderSide(width: 1, color: Colors.indigo)),
                    onPressed: () {
                      setState(() {
                        clicked = !clicked;
                      });
                    },
                    child: Text(
                      'Choose Room',
                      style: TextStyle(
                          color: clicked ? Colors.white : Colors.indigo),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
