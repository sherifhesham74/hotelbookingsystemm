import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hotelbooking/controllers/usersController.dart';
import 'package:hotelbooking/services/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/users.dart';

class ClientsServices {
  UsersController _usersController = Get.find();
  final String mainurl = "192.168.1.10:45457";

  clinetsRegister(Users user) async {
    final String url = "http://$mainurl/api/Users";
    var json = {
      "role": "${user.role}",
      "name": "${user.name}",
      "password": "${user.password}",
      "email": '${user.email}',
      "photo": '${user.photo}',
      "address": "${user.address}",
      "phone" : "0",
      "lat" : 0,
      "lng" : 0
    };
    var body = jsonEncode(json);
    try {
      http.Response response = await http.post(Uri.parse(url),
          body: body, headers: {"Content-Type": "application/json"});
      print(response.statusCode);
      var responseJson = jsonDecode(response.body);
    } catch (e) {
      _usersController.userExist = true.obs;
    }
  }

  clientsLogin(String email, String password) async {
    final uri = Uri.http(
        mainurl, '/api/Users/Login', {"email": email, "password": password});
    final headers = {"Content-Type": 'application/json'};
    if (kDebugMode) {
      print(uri);
    }
    try {
      final response = await http.get(uri, headers: headers);
      if (kDebugMode) {
        print(response.statusCode);
      }
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        if (body.isEmpty) {
          return 'Email or Password invalid';
        } else {
          await SharedPrefs().login(
            body[0]['name'],
            body[0]['email'],
            body[0]['userid'],
            body[0]['role'],
            body[0]['password'],
            body[0]['photo'],
            body[0]['isdeleted'],
            body[0]['address'],
          );
          return body[0]['role'];
        }
      }
    } catch (e) {
      print(e);
    }
  }

  getuserNamebyId(int id) async {
    final String path = 'http://$mainurl/api/Users/$id';
    final headers = {"Content-Type": 'application/json'};
    try {
      final response = await http.get(Uri.parse(path), headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        return body['name'];
      }
    } catch (e) {
      print(e);
    }
  }

  changeClientName(int userid, String name, String email, String password,
      String address, String photo, bool isdeleted, String role) async {
    final String path = 'http://$mainurl/api/Users/$userid';
    try {

      Map<String, dynamic> body = {
        "name": name,
        "userid": userid,
        "email": email,
        "password": password,
        "address": address,
        "photo": photo,
        "role": role,
        "isdeleted": isdeleted
      };
      String encodedbody = jsonEncode(body);
      final response = await http.put(
        Uri.parse(path),
        body: encodedbody,
        headers: {"content-type": "application/json"},
        encoding: Encoding.getByName("utf-8"),
      );
      print(name);
      String newName = await SharedPrefs().setClientName(name);
      print(newName);
      return newName;
    } catch (e) {
      print(e);
    }
  }


  changeClientPhoto(int userid, String name, String email, String password,
      String address, String photo, bool isdeleted, String role) async {
    final String path = 'http://$mainurl/api/Users/$userid';
    try {

      Map<String, dynamic> body = {
        "name": name,
        "userid": userid,
        "email": email,
        "password": password,
        "address": address,
        "photo": photo,
        "role": role,
        "isdeleted": isdeleted
      };
      String encodedbody = jsonEncode(body);
      final response = await http.put(
        Uri.parse(path),
        body: encodedbody,
        headers: {"content-type": "application/json"},
        encoding: Encoding.getByName("utf-8"),
      );
      print(photo);
      String newPhoto = await SharedPrefs().setClientPhoto(photo);
      print(newPhoto);
      return newPhoto;
    } catch (e) {
      print(e);
    }
  }

}
