import 'package:flutter/material.dart';
import 'package:hotelbooking/models/hotels.dart';
import 'package:hotelbooking/ui/widgets/hotelTile_Widget.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({Key? key, required this.cityName}) : super(key: key);
  final String cityName;

  @override
  _HotelsScreenState createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  List<Hotel> hotels = [
    Hotel(
        name: 'Aswan Hotel',
        imageUrl:
            'https://th.bing.com/th/id/R.a587a778d25b5a5725d053d0b6d2dc54?rik=%2bhQil8NsVm%2bDPA&pid=ImgRaw&r=0',
        price: 600,
        reviewsNumber: 40,
        stars: 4,
        locationCity: 'Aswan'),
    Hotel(
        name: 'Cairo Hotel',
        imageUrl:
        'https://th.bing.com/th/id/R.a587a778d25b5a5725d053d0b6d2dc54?rik=%2bhQil8NsVm%2bDPA&pid=ImgRaw&r=0',
        price: 1000,
        reviewsNumber: 40,
        stars: 5,
        locationCity: 'Cairo'),
    Hotel(
        name: 'Luxor Hotel',
        imageUrl:
        'https://th.bing.com/th/id/R.a587a778d25b5a5725d053d0b6d2dc54?rik=%2bhQil8NsVm%2bDPA&pid=ImgRaw&r=0',
        price: 700,
        reviewsNumber: 50,
        stars: 3,
        locationCity: 'Luxor'),
  ];
  List<Hotel> dummyList =[];

  @override
  void initState() {
    // TODO: implement initState
    hotels.forEach((element) {
      if(element.locationCity == widget.cityName){
        dummyList.add(element);
      }
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black54,),
      body: dummyList.isNotEmpty ?ListView.builder(itemCount: dummyList.length,itemBuilder: (BuildContext context, int index){
        return hotelTileWidget(context, dummyList[index]);
      }): const Center(child: Text("THERE is NO HOTELS"),),
    );
  }
}
