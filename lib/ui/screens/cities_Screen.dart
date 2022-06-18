import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/models/cities.dart';
import 'package:hotelbooking/ui/widgets/cityTile_Widget.dart';
import 'package:hotelbooking/ui/widgets/searchBar_Widget.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({Key? key}) : super(key: key);

  @override
  _CitiesScreenState createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  List<City> cities = [
    City(name: 'Luxor', urlImage: 'assets/images/luxor.jpg', distance: 657),
    City(name: 'Cairo', urlImage: 'assets/images/cairo.jpg', distance: 0),
    City(name: 'Aswan', urlImage: 'assets/images/aswan.jpg', distance: 882),
    City(
        name: 'Sharm El Sheikh',
        urlImage: 'assets/images/sharm.jpg',
        distance: 502),
    City(name: 'Alexandria', urlImage: 'assets/images/alex.jpg', distance: 300),
  ];
  List<City> dublicatedcities = [];
  String searchtext = '';

  @override
  void initState() {
    // TODO: implement initState
    dublicatedcities.addAll(cities);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          searchBarWidget(context, filterSearchResults),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: listView(),
          ),
        ],
      ),
    );
  }

  Widget listView() {
    return ListView(
      children: dublicatedcities
          .map((city) => cityTileWidget(context, city))
          .toList(),
    );
  }

  void filterSearchResults(String query) {
    List<City> dummySearchList = [];
    dummySearchList.addAll(dublicatedcities);
    if (query.isNotEmpty) {
      List<City> dummyListData = [];
      dummySearchList.forEach((element) {
        if (element.name.toLowerCase().contains(query)) {
          dummyListData.add(element);
        }
      });
      setState(() {
        dublicatedcities.clear();
        dublicatedcities.addAll(dummyListData);
      });
    } else {
      setState(() {
        dublicatedcities.clear();
        dublicatedcities.addAll(cities);
      });
    }
  }
}
