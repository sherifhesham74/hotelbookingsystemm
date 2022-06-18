import 'package:flutter/material.dart';
import 'package:hotelbooking/services/shared_prefs.dart';
import 'package:hotelbooking/ui/screens/hotelOwner/hotelProfile_Screen.dart';
import 'dart:io';
import '../../../services/ui_services.dart';
import 'package:get/get.dart';
import '../../widgets/alertDialog_Widget.dart';
import '../../widgets/roomsAlertDialog_Widget.dart';

class AddRoomImagesScreen extends StatefulWidget {
  const AddRoomImagesScreen({Key? key,required this.roomid}) : super(key: key);
  final int roomid;
  @override
  _AddRoomImagesScreenState createState() => _AddRoomImagesScreenState();
}

class _AddRoomImagesScreenState extends State<AddRoomImagesScreen> {
  String pathImage1 = "";
  String pathImage2 = "";
  String pathImage3 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        margin: EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: ()async{
                String path =await UiServices().chooseRoomImage(widget.roomid);
                setState(() {
                 pathImage1 = path;
                });

              },
              child: Container(
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
                    pathImage1!= ""? ClipRRect(
                      borderRadius:
                      BorderRadius.all(Radius.circular(15)),
                      child: Image.file(
                        File.fromUri(Uri.parse(pathImage1)),
                        width: 400,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ) : ClipRRect(
                      borderRadius:
                      BorderRadius.all(Radius.circular(15)),
                      child: Image.network(
                        "https://th.bing.com/th/id/OIP.1tmbPfHMYVZGp-dgPvjm_wHaEJ?pid=ImgDet&rs=1",
                        width: 400,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
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
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: () async{
                String path =await UiServices().chooseRoomImage(widget.roomid);
                setState((){
                  pathImage2 = path;
                });

              },
              child: Container(
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
                    pathImage2!= ""? ClipRRect(
                      borderRadius:
                      BorderRadius.all(Radius.circular(15)),
                      child: Image.file(
                        File.fromUri(Uri.parse(pathImage2)),
                        width: 400,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ) : ClipRRect(
                      borderRadius:
                      BorderRadius.all(Radius.circular(15)),
                      child: Image.network(
                        "https://th.bing.com/th/id/OIP.1tmbPfHMYVZGp-dgPvjm_wHaEJ?pid=ImgDet&rs=1",
                        width: 400,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
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
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: () async{
                String path =await UiServices().chooseRoomImage(widget.roomid);
                setState((){
                  pathImage3 = path;
                });

              },
              child: Container(
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
                    pathImage3!= ""? ClipRRect(
                      borderRadius:
                      BorderRadius.all(Radius.circular(15)),
                      child: Image.file(
                        File.fromUri(Uri.parse(pathImage3)),
                        width: 400,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ) : ClipRRect(
                      borderRadius:
                      BorderRadius.all(Radius.circular(15)),
                      child: Image.asset(
                        "assets/images/blank.jpg",
                        width: 400,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
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
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: 200,
              child: FloatingActionButton(
                backgroundColor: Colors.indigo,
                onPressed: () async{
                  if (pathImage1.isNotEmpty && pathImage2.isNotEmpty && pathImage3.isNotEmpty) {
                    int hotelid =await SharedPrefs().getClientId();
                    Get.off(HotelProfileScreen(hotelid: hotelid));
                  }
                  else{
                    const snackBar = SnackBar(
                      content: Text(
                        'Enter All of the Images',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    );
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snackBar);
                  }
                },
                child: const Text('Save'),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
          ],
      ),
        ),)),
    );
  }
}
