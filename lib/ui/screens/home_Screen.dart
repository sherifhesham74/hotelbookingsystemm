import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/ui/screens/cities_Screen.dart';
import 'package:hotelbooking/ui/screens/profile_Screen.dart';
import 'package:hotelbooking/ui/screens/reviews_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyWidget(_selectedindex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedindex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap:
          selectIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.location_city),label: "Cities"),
          BottomNavigationBarItem(icon: Icon(Icons.rate_review),label: "Reviews"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
      ),
    );
  }

  void selectIndex(int index){
    setState(() {
      _selectedindex = index;
    });
    if (kDebugMode) {
      print(_selectedindex);

    }}

 Widget bodyWidget(int index){
    if(_selectedindex == 0){
      return CitiesScreen();
    }
    else if(_selectedindex == 1){
      return ReviewsScreen();
    }
    else{
      return ProfileScreen();
    }
  }
}
