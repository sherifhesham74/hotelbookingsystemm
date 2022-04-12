import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/controllers/reservationsController.dart';
import 'package:hotelbooking/services/ui_services.dart';
import 'package:hotelbooking/ui/screens/clientProfile_Screen.dart';

import '../../../controllers/hotelsController.dart';
import '../../../services/shared_prefs.dart';
import '../../widgets/alertDialog_Widget.dart';
import '../../widgets/roomTile_Widget.dart';
import '../login.dart';
import 'dart:io';

class HotelProfileScreen extends StatefulWidget {
  const HotelProfileScreen({Key? key, required this.hotelid}) : super(key: key);
  final int hotelid;

  @override
  _HotelProfileScreenState createState() => _HotelProfileScreenState();
}

class _HotelProfileScreenState extends State<HotelProfileScreen> {
  TextEditingController hotelNameController = TextEditingController();
  HotelsController _hotelsController = Get.put(HotelsController());
  String name = '';

  @override
  void initState() {
    // TODO: implement initState

    getClientInfo();

    _hotelsController.getHotelRooms(widget.hotelid);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text('Add Room'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () async{
                // Update the state of the app
                await SharedPrefs().logout();
                Navigator.pop(context);
                Get.off(Login());
                // Then close the drawer
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  AlertDialogWidget(context);
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
                      FutureBuilder(
                          future: UiServices().getClientImage(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              String path = snapshot.data;
                              return path != "photo"
                                  ? ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      child: Image.file(
                                        File.fromUri(Uri.parse(path)),
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      child: Image.network(
                                        "https://irisvision.com/wp-content/uploads/2019/01/no-profile-1-1024x1024.png",
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fill,
                                      ),
                                    );
                            } else {
                              return CircularProgressIndicator();
                            }
                          }),
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
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: hotelNameController,
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
              const SizedBox(height: 20,),
              GetBuilder<HotelsController>(
                builder: (_) => Expanded(
                  child: ListView.builder(
                      itemCount: _hotelsController.hotelRooms.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _hotelsController.hotelRooms.isNotEmpty
                            ? Stack(
                                alignment: AlignmentDirectional.topStart,
                                children: [
                                  RoomTileWidget(
                                      room:
                                          _hotelsController.hotelRooms[index]),
                                  Container(
                                    child: IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {},
                                    ),
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(0, 1)),
                                        ],
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ],
                              )
                            : CircularProgressIndicator();
                      }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              SizedBox(
                width: 200,
                child: FloatingActionButton(
                  backgroundColor: Colors.indigo,
                  onPressed: () {
                    if (hotelNameController.text.isNotEmpty) {
                      SharedPrefs().setNewName(hotelNameController.text);
                    }
                  },
                  child: const Text('Save'),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getClientInfo() async {
    String returnedname = await SharedPrefs().getClientName();

    print(returnedname);
    setState(() {
      name = returnedname;
    });
  }
}
