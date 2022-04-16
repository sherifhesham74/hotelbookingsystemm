import 'package:flutter/material.dart';
import 'package:hotelbooking/services/http/rooms_services.dart';
import 'package:hotelbooking/services/shared_prefs.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:hotelbooking/ui/screens/hotelOwner/addRoomImages_Screen.dart';
import '../../widgets/alertDialog_Widget.dart';

class AddRoomScreen extends StatefulWidget {
  const AddRoomScreen({Key? key}) : super(key: key);

  @override
  _AddRoomScreenState createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  TextEditingController roomNameController = TextEditingController();
  TextEditingController roomCostController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey,),
      body: Form(
        key: _formKey,
        child: SafeArea(child: Container(
          margin : EdgeInsets.all(20),
          child: Column(
          children: [
            TextFormField(
              controller: roomNameController,
              validator: (value){
                if(value == ''){
                  return 'Please Fill this Field';
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Room name",
                suffixIcon: const Icon(Icons.person),
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: roomCostController,
              validator: (value){
                if(value == ''){
                  return 'Please Fill this Field';
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Room Cost",
                suffixIcon: const Icon(Icons.person),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15,),

            SizedBox(
              width: 200,
              child: FloatingActionButton(
                backgroundColor: Colors.indigo,
                onPressed: () async{
                  if(_formKey.currentState!.validate()){
                    int hotelid = await SharedPrefs().getClientId();
                    int roomid = await RoomsServices().addRoom(double.parse(roomCostController.text), roomNameController.text, hotelid);
                    Get.to(AddRoomImagesScreen(roomid: roomid,));
                  }
                },
                child: const Text('Next'),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
          ],
        ),)),
      ),
    );
  }
}
