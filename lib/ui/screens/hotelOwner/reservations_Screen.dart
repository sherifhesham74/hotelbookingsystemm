import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/shared_prefs.dart';
import '../login.dart';

class HotelReservationsScreen extends StatefulWidget {
  const HotelReservationsScreen({Key? key}) : super(key: key);

  @override
  _HotelReservationsScreenState createState() => _HotelReservationsScreenState();
}

class _HotelReservationsScreenState extends State<HotelReservationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: RaisedButton(color: Colors.indigo,child:const Text('Logout',style: TextStyle(color: Colors.white),),onPressed: (){
        SharedPrefs().logout();
        Get.off(Login());
      }),),
    );
  }
}
