import 'dart:convert';

import 'package:hotelbooking/models/photos.dart';
import 'package:hotelbooking/models/rooms.dart';
import 'package:http/http.dart' as http;

import 'clients_services.dart';

class RoomsServices{
  final String url = ClientsServices().mainurl;

  getRoomPhotos(int id)async{
    String path = "http://$url/api/Photos/room/$id";

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



  getHotelId(int id) async{
    String path = "http://$url/api/Rooms/$id";
    http.Response response = await http.get(Uri.parse(path));
    try{
      if(response.statusCode == 200){
        Map<String, dynamic> body = jsonDecode(response.body);
        return body['hotelid'];
      }
    }
    catch(e){
      print(e);
    }
  }

  addRoom(double cost,String name, int hotelid)async{
    String path = "http://$url/api/Rooms";
    print(hotelid);

    print(cost);
    print(name);
    var json = {
      "hotelid" : hotelid,
      "type" : name,
      "cost" : cost.toInt(),
      "time" : ""
    };
    var body = jsonEncode(json);
    try{
      http.Response response = await http.post(Uri.parse(path),body: body,headers: {"Content-Type": "application/json"});
      print('done');
      print(response.statusCode);
      if(response.statusCode == 200){
        Map<String, dynamic> body = jsonDecode(response.body);
        return body['roomid'];
      }
    }
    catch(e){
      print(e);
    }

  }


  addRoomImage(int roomid,String imagepath)async{
    String path = "http://$url/api/Photos";
    var json = {
      "roomid" : roomid,
      "photo1" : imagepath,
    };
    var body = jsonEncode(json);
    http.Response response = await http.post(Uri.parse(path), body: body,headers: {"Content-Type": "application/json"});
    if(response.statusCode == 200){
      print('image added');
      Map<String, dynamic> body = jsonDecode(response.body);
      print(body);
      return body['photo1'];
    }
  }

  getRoomById(int id) async{
    String path = "http://$url/api/Rooms/$id";
    http.Response response = await http.get(Uri.parse(path));
    if(response.statusCode== 200){
      Map<String, dynamic> body = jsonDecode(response.body);
      Room room = Room(id: body['roomid'], hotelId: body['hotelid'], name: body['type'], cost: double.parse(body['cost'].toString()));
      return room;
    }
  }

  changeRoomPhoto(String newpath,int roomid, int photoid)async{
    String path = "http://$url/api/Photos/$photoid";
    var json = {
      "roomid" : roomid,
      "photoid" : photoid,
      "photo1" : newpath
    };
    var body = jsonEncode(json);
    http.Response response = await http.put(Uri.parse(path),body: body, headers: {"content-type": "application/json"},
      encoding: Encoding.getByName("utf-8"),);
  }

  deleteRoom(int roomid)async{
    String path = "http://$url/api/Rooms/delete/$roomid";
    http.Response response =await http.put(Uri.parse(path));
  }

  changeRoomCost(Room room)async{
    String path = "http://$url/api/Rooms/${room.id}";
    print(room.id);
    print(room.cost);
    var json ={
      "roomid": room.id,
      "hotelid": room.hotelId,
      "isreserved": false,
      "cost": room.cost.toInt(),
      "time": "1",
      "type": room.name,
      "isdeleted": false,
    };
    var body = jsonEncode(json);
    http.Response response =await http.put(Uri.parse(path),body: body,headers: {"content-type": "application/json"},
      encoding: Encoding.getByName("utf-8"),);
    print(response.statusCode);
  }

  changeRoomName(Room room)async{
    String path = "http://$url/api/Rooms/${room.id}";
    var json ={
      "roomid": room.id,
      "hotelid": room.hotelId,
      "cost": room.cost.toInt(),
      "time": "1",
      "isreserved" : false,
      "isdeleted" : false,
      "type": room.name,

    };
    var body = jsonEncode(json);
    http.Response response =await http.put(Uri.parse(path),body: body,headers: {"content-type": "application/json"},
      encoding: Encoding.getByName("utf-8"),);
    print(response.statusCode);
  }
}