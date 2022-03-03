import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/ui/screens/cities_Screen.dart';
import 'package:hotelbooking/ui/screens/home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HotelBooking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0
        )
      ),
      home: HomeScreen(),
    );
  }
}
