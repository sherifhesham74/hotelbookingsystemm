import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/services/http/rooms_services.dart';
import 'dart:io';
import 'package:get/get.dart';
import '../../../models/photos.dart';
import '../../../models/rooms.dart';
import 'package:hotelbooking/controllers/roomsController.dart';
import '../../../services/ui_services.dart';

class EditRoomScreen extends StatefulWidget {
  const EditRoomScreen({Key? key,required this.room,}) : super(key: key);
  final Room room;

  @override
  _EditRoomScreenState createState() => _EditRoomScreenState();
}

class _EditRoomScreenState extends State<EditRoomScreen> {
  RoomsController _roomsController = Get.find();
  TextEditingController roomNameController = TextEditingController();
  TextEditingController roomCostController = TextEditingController();


  String name = "";
  double cost = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    getRoomInfo(widget.room.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Room dummyroom = widget.room;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: roomNameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: name,
                suffixIcon: const Icon(Icons.person),
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 15,),
            TextFormField(
              controller: roomCostController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: cost.toString(),
                suffixIcon: const Icon(Icons.person),
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 15,),
           FutureBuilder(future: RoomsServices().getRoomPhotos(widget.room.id),builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  List<Photo> photo = snapshot.data;
                  return Expanded(

                    child: ListView.builder(
                      itemCount: photo.length,
                      itemBuilder:(BuildContext context, int index){
                        return InkWell(
                          onTap: ()async{
                           String newpath= await UiServices().updateRoomImage(widget.room.id);
                           if(newpath.isNotEmpty){
                             RoomsServices().changeRoomPhoto(newpath, widget.room.id, photo[index].PhotoId!);
                             getRoomInfo(widget.room.id);
                           }


                          },
                          child: Container(
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 1)),
                              ],
                            ),
                            child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                  child: Image.file(
                                    File.fromUri(Uri.parse(photo[index].PhotoUrl)),
                                    width: 400,
                                    height: 150,
                                    fit: BoxFit.fill,
                                  ),
                                ) ,
                                Container(
                                    width: 30,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(0, 1)),
                                        ],
                                        color: Colors.white),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.grey,
                                      size: 20,
                                    )),
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                  );
                }
                else{
                  return ClipRRect(
                    borderRadius:
                    BorderRadius.all(Radius.circular(15)),
                    child: Image.network(
                      "https://th.bing.com/th/id/OIP.1tmbPfHMYVZGp-dgPvjm_wHaEJ?pid=ImgDet&rs=1",
                      width: 400,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                  );
                }
              }),

            SizedBox(
              width: 200,
              child: FloatingActionButton(
                backgroundColor: Colors.indigo,
                onPressed: ()async {
                  if(roomCostController.text.isNotEmpty){
                    await changeRoomCost(widget.room.hotelId, widget.room.id, double.parse(roomCostController.text), name);
                  }
                  if(roomNameController.text.isNotEmpty){
                    await changeRoomName(widget.room.hotelId, widget.room.id, cost, roomNameController.text);
                  }

                },
                child: const Text('Save'),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
          ],
        ),
      )),
    );
  }

  getRoomInfo(int roomid) async {
    Room returnedRoom = await RoomsServices().getRoomById(roomid);
    setState(() {
      name = returnedRoom.name;
      cost = returnedRoom.cost;
    });
  }


  changeRoomCost(int hotelid, int roomid, double cost,String name)async{
    Room room = Room(id: roomid, hotelId: hotelid, name: name, cost: cost);
    await RoomsServices().changeRoomCost(room);
    getRoomInfo(roomid);
  }

  changeRoomName(int hotelid, int roomid, double cost,String name)async{
    Room room = Room(id: roomid, hotelId: hotelid, name: name, cost: cost);
    await RoomsServices().changeRoomName(room);
    getRoomInfo(roomid);
  }
}
