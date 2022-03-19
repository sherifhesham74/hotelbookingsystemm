import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hotelbooking/controllers/usersController.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../models/users.dart';

class ClientsServices {
  UsersController _usersController = Get.find();

  clinetsRegister(Users user) async {
    final String url = "http://192.168.1.10:45455/api/Users";
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
    final uri = Uri.http('192.168.1.10:45455', '/api/Users/Login',
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
          return body[0]['role'];
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
