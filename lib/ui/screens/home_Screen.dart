import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/controllers/reservationsController.dart';
import 'package:hotelbooking/controllers/screensController.dart';
import 'package:hotelbooking/ui/screens/cities_Screen.dart';
import 'package:hotelbooking/ui/screens/profile_Screen.dart';
import 'package:hotelbooking/ui/screens/bookings_Screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScreensController _controller = Get.put(ScreensController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyWidget(int.parse(_controller.screenIndex.toString())),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: int.parse(_controller.screenIndex.toString()),
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap:
          selectIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.location_city),label: "Cities"),
          BottomNavigationBarItem(icon: Icon(Icons.rate_review),label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
      ),
    );
  }

  void selectIndex(int index) {
    setState(() {
      _controller.screenIndex = index.obs;
    });
  }

 Widget bodyWidget(int index){
    if(_controller.screenIndex == 0.obs){
      return CitiesScreen();
    }
    else if(_controller.screenIndex == 1.obs){
      return BookingsScreen();
    }
    else{
      return ProfileScreen();
    }
  }
}
