import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hotelbooking/controllers/usersController.dart';
import 'package:hotelbooking/services/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../models/users.dart';

class ClientsServices {
  UsersController _usersController = Get.find();
  final String mainurl = "192.168.1.10:45455";

  clinetsRegister(Users user) async {
    final String url = "http://$mainurl/api/Users";
    var json = {
      "role": "${user.role}",
      "name": "${user.name}",
      "password": "${user.password}",
      "email": '${user.email}',
      "photo": '${user.photo}',
      "address": "${user.address}"
    };
    var body = jsonEncode(json);
    try {
      http.Response response = await http.post(Uri.parse(url),
          body: body, headers: {"Content-Type": "application/json"});
      var responseJson = jsonDecode(response.body);
    } catch (e) {
      _usersController.userExist = true.obs;
    }
  }

  clientsLogin(String email, String password) async {
    final uri = Uri.http(mainurl, '/api/Users/Login',
        {"email": email, "password": password});
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
        }
        else {
          await SharedPrefs().login(
              body[0]['name'], body[0]['email'], body[0]['userid'],
              body[0]['role']);
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
    }
    catch (e) {
      print(e);
    }
  }
}
