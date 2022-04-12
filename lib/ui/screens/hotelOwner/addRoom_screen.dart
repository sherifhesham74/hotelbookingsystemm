import 'package:flutter/material.dart';
import 'dart:io';

import '../../widgets/alertDialog_Widget.dart';

class AddRoomScreen extends StatefulWidget {
  const AddRoomScreen({Key? key}) : super(key: key);

  @override
  _AddRoomScreenState createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  TextEditingController roomNameController = TextEditingController();
  TextEditingController roomCostController = TextEditingController();
  String pathImage1 = "";
  String pathImage2 = "";
  String pathImage3 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey,),
      body: SafeArea(child: Container(child: Column(
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
              labelText: "Room name",
              suffixIcon: const Icon(Icons.person),
            ),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 10,),
          TextFormField(
            controller: roomCostController,
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
                 pathImage1!= ""? ClipRRect(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15)),
                            child: Image.file(
                              File.fromUri(Uri.parse(pathImage1)),
                              width: 200,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          ) : ClipRRect(
                   borderRadius:
                   BorderRadius.all(Radius.circular(15)),
                   child: Image.network(
                     "https://th.bing.com/th/id/OIP.1tmbPfHMYVZGp-dgPvjm_wHaEJ?pid=ImgDet&rs=1",
                     width: 200,
                     height: 100,
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
        ],
      ),)),
    );
  }
}
