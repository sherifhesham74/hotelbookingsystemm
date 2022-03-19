import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotelbooking/ui/screens/cities_Screen.dart';
import 'package:hotelbooking/ui/screens/home_Screen.dart';
import 'package:hotelbooking/ui/screens/login.dart';
import 'package:hotelbooking/ui/screens/register.dart';

void main() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

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
          appBarTheme:
              AppBarTheme(backgroundColor: Colors.white, elevation: 0)),
      home: Login(),
    );
  }
}
