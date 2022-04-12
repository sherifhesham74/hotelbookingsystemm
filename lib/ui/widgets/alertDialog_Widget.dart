import 'package:flutter/material.dart';
import 'package:hotelbooking/services/ui_services.dart';

AlertDialogWidget(BuildContext context){

  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text("Choose Image From"),

      actions: <Widget>[
        RaisedButton(onPressed: (){
          Navigator.pop(context);
          UiServices().setNewImage();
        },child: const Text('Gallery'),),
      ],
    ),
  );
}