import 'package:flutter/material.dart';
import 'package:hotelbooking/services/ui_services.dart';

RoomsAlertDialogWidget(BuildContext context,int roomid)async{

   await showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text("Choose Image From"),

      actions: <Widget>[
        RaisedButton(onPressed: ()async{
          Navigator.pop(context);
          await UiServices().chooseRoomImage(roomid);
        },child: const Text('Gallery'),),
      ],
    ),
  );
}