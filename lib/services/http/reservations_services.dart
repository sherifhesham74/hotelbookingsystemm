import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hotelbooking/models/reservations.dart';
import 'package:hotelbooking/services/shared_prefs.dart';
import 'package:http/http.dart' as http;

import 'clients_services.dart';

class ReservationsServices {
  final String url = ClientsServices().mainurl;

  postReservations(Reservation reservation) async {
    final String path = "http://$url/api/Reservations";
    var json = {
      "totalcost": "${reservation.cost}",
      "startdate": "${reservation.startDate}",
      "enddate": "${reservation.endDate}",
      "hotelid": "${reservation.hotelid}",
      "roomid": "${reservation.roomid}",
      "clientid": "${reservation.clientid}",
      "number": "${reservation.roomsNumber}"
    };
    var body = jsonEncode(json);
    try {
      http.Response response = await http.post(Uri.parse(path),
          body: body, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        print('reserve done');
      }
    } catch (e) {
      print(e);
    }
  }

  getClientReservations(int id) async {
    final String path = "http://$url/api/Reservations/client/$id";
    http.Response response = await http.get(Uri.parse(path));
    try {
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        print(body);
        List<Reservation> reservations =
            body.map((res) => Reservation.fromjson(res)).toList();
        return reservations;
      }
    } catch (e) {
      print(e);
    }
  }

  cancelReservation(int reservationid) async {
    final String path = "http://$url/api/Reservations/delete/$reservationid";
    http.Response response = await http.put(
      Uri.parse(path),
      headers: {"content-type": "application/json"},
      encoding: Encoding.getByName("utf-8"),
    );

  }
}
