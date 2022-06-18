import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/models/photos.dart';
import 'package:hotelbooking/models/rooms.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotelbooking/controllers/roomsController.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:get/get.dart';
import 'dart:io';

class RoomTileWidget extends StatefulWidget {
  const RoomTileWidget({Key? key, required this.room}) : super(key: key);
  final Room room;

  @override
  _RoomTileWidgetState createState() => _RoomTileWidgetState();
}

class _RoomTileWidgetState extends State<RoomTileWidget> {
  bool clicked = false;
  List<Photo> photos = [];
  RoomsController _roomsController = Get.put(RoomsController());


  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.topStart, children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
            FutureBuilder(
                future: _roomsController.getRoomsPhotoC(widget.room.id),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Photo> photos = snapshot.data!;
                    return Expanded(
                      child: CarouselSlider(
                        options: CarouselOptions(),
                        items: photos.map((image) =>
                            Image.file(
                              File.fromUri(Uri.parse(image.PhotoUrl))
                              //image: Image.file(File),
                            ))
                            .toList()
                      ),
                    );
                }
                  else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                }

            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              padding: const EdgeInsets.only(right: 10, top: 15, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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

                  Text(
                    'EGP ${widget.room.cost}',
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 19,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

    ]);
  }

  roomPhotos(int id) async {
    photos = await _roomsController.getRoomsPhotoC(id);
  }
}
