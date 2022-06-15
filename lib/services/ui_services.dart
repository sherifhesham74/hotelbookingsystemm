import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/services/http/rooms_services.dart';
import 'package:hotelbooking/services/shared_prefs.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'http/clients_services.dart';

class UiServices{
  startsDisplay(int starsnum){
    List<Widget> numOfStars = [];

    while (starsnum != 0) {
      numOfStars.add(Icon(
        Icons.star,
        color: Colors.amber,
        size: 25,
      ));
      starsnum = starsnum - 1;
    }
    return numOfStars;
  }

  changeClientImage()async{
    final ImagePicker _picker = ImagePicker();
    String selectedImage = '';
    XFile? galleryFile = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = galleryFile!.path;
    print('here');
    print(selectedImage);
    return selectedImage;
  }
  setNewImage() async {
    String imagepath = await getImagePath();
    int userid = await SharedPrefs().getClientId();
    String name = await SharedPrefs().getClientName();
    String email = await SharedPrefs().getClientEmail();
    String address = await SharedPrefs().getClientAddress();
    String password = await SharedPrefs().getClientPassword();
    bool isdeleted = await SharedPrefs().getClientisDeleted();
    String role = await SharedPrefs().getClientRole();
    ClientsServices().changeClientPhoto(userid, name, email, password, address, imagepath, isdeleted, role);
  }

  getImagePath() async {
    String path = await UiServices().changeClientImage();
    return path;
  }
  getClientImage()async{
    String returnedphoto = await SharedPrefs().getClientPhoto();
    return returnedphoto;
  }


  chooseRoomImage(int roomid)async{
    final ImagePicker _picker = ImagePicker();
    String selectedImage = '';
    XFile? galleryFile = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = galleryFile!.path;
    await RoomsServices().addRoomImage(roomid, selectedImage);
    print('ui services');
    return selectedImage;

  }

  updateRoomImage(int roomid)async{
    final ImagePicker _picker = ImagePicker();
    String selectedImage = '';
    XFile? galleryFile = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = galleryFile!.path;
    print('ui services');
    print(selectedImage);
    return selectedImage;

  }

  chooseHotelImage()async{
    final ImagePicker _picker = ImagePicker();
    String selectedImage = '';
    XFile? galleryFile = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = galleryFile!.path;
    print('ui services');
    print(selectedImage);
    return selectedImage;

  }
}