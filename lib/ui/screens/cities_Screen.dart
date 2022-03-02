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
    City(
        name: 'Luxor',
        urlImage:
            'https://th.bing.com/th/id/R.db5042888819dd3388f8271e757a2eb5?rik=HFeR0kmGRnJNtw&riu=http%3a%2f%2f1.bp.blogspot.com%2f-NrIAEQwfcE8%2fUGx6HXduQaI%2fAAAAAAAATVI%2fphZswXDquHU%2fs1600%2fluxor-egypt.jpg&ehk=8Rqif2%2fFukBpjGqETQCSoIke61H0aFLsFO2kgaGFsrE%3d&risl=&pid=ImgRaw&r=0',
        distance: 657),
    City(
        name: 'Cairo',
        urlImage:
            'https://media.gettyimages.com/photos/beautiful-view-of-cairo-and-the-nile-from-above-egypt-picture-id1148380677',
        distance: 0),
    City(
        name: 'Aswan',
        urlImage:
            'https://th.bing.com/th/id/R.be2e7ea45b13928aed801fe445842db7?rik=Sy9xqrY6OGzmqw&riu=http%3a%2f%2fwww.roundtheworldmagazine.com%2fwp-content%2fuploads%2f2017%2f11%2fFirst-Cataracts-in-the-Nile-Aswan-Egypt-1024x785.jpg&ehk=Bf9xmqSP3l7Ry%2bAgOto8JWNyqAWWXrNMsd1xmS7KYjo%3d&risl=&pid=ImgRaw&r=0',
        distance: 882),
    City(
        name: 'Sharm El Sheikh',
        urlImage:
            'https://media.gettyimages.com/photos/sunny-resort-beach-with-palm-tree-at-the-coast-shore-of-red-sea-in-picture-id1173359888',
        distance: 502)
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

    return  SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      searchBarWidget(context,filterSearchResults),
            const SizedBox(height: 20,),
            Expanded(
              child: listView(),

           ),
          ],
        ),
    );
  }
  Widget listView(){
    return ListView(
      children: dublicatedcities.map((city) => cityTileWidget(context, city)).toList(),
    );
  }

  void filterSearchResults(String query){
    List<City> dummySearchList = [];
    dummySearchList.addAll(dublicatedcities);
    if(query.isNotEmpty){
      List<City> dummyListData = [];
      dummySearchList.forEach((element) {
        if(element.name.toLowerCase().contains(query)){
         dummyListData.add(element);
        }
      });
      setState(() {
        dublicatedcities.clear();
        dublicatedcities.addAll(dummyListData);
      });
    }
    else{
      setState(() {
        dublicatedcities.clear();
        dublicatedcities.addAll(cities);
      });
    }
  }
}
