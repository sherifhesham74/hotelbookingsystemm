import 'dart:convert';

import 'package:hotelbooking/models/photos.dart';
import 'package:http/http.dart' as http;

class RoomsServices{
  final String url = '192.168.1.10:45455';

  getRoomPhotos(int id)async{
    String path = "http://$url/api/Photos?id=$id";

    http.Response response = await http.get(Uri.parse(path));
    try{
      if(response.statusCode == 200){
        List<dynamic> body = jsonDecode(response.body);
        List<Photo> photos = body.map((photos) => Photo.fromJson(photos)).toList();
        return photos;
      }
    }
    catch(e){
      print(e);
    }
  }
}