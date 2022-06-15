import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotelbooking/controllers/usersController.dart';
import 'package:hotelbooking/services/shared_prefs.dart';
import 'package:hotelbooking/ui/screens/admin/adminHome_Screen.dart';
import 'package:hotelbooking/ui/screens/cities_Screen.dart';
import 'package:hotelbooking/ui/screens/home_Screen.dart';
import 'package:hotelbooking/ui/screens/hotelOwner/reservations_Screen.dart';
import 'package:hotelbooking/ui/screens/login.dart';
import 'package:hotelbooking/ui/screens/register.dart';

void main() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application
  bool loggedin = false;
  String role = '';

  check() async {
    bool? value = await SharedPrefs().checkLogin();
    String? userrole = await SharedPrefs().checkRole();
    setState(() {
      loggedin = value!;
      role = userrole!;
    });
    print(loggedin);
    print(role);
  }

  @override
  void initState() {
    check();
    super.initState();
  }

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
      home: screenNavigation(role, loggedin),
    );
  }

  screenNavigation(String role,bool logged){
     if(logged == true){
       if(role == 'client'){
         return HomeScreen();
       }
       else if(role == 'hotel'){
         return HotelReservationsScreen();
       }
       else{
         return AdminHomeScreen();
       }
     }
     else{
       return Login();
     }
  }
}
