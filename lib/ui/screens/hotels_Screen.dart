import 'package:flutter/material.dart';
import 'package:hotelbooking/controllers/hotelsController.dart';
import 'package:hotelbooking/models/hotels.dart';
import 'package:hotelbooking/ui/widgets/hotelTile_Widget.dart';
import 'package:get/get.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({Key? key, required this.cityName}) : super(key: key);
  final String cityName;

  @override
  _HotelsScreenState createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  HotelsController _hotelsController = Get.find();
  List<Hotel> hotels = [
    Hotel(
        name: 'Aswan Hotel',
        imageUrl:
            'https://th.bing.com/th/id/R.a587a778d25b5a5725d053d0b6d2dc54?rik=%2bhQil8NsVm%2bDPA&pid=ImgRaw&r=0',
        price: 600,
        reviewsNumber: 40,
        stars: 4,
        locationCity: 'Aswan',
        lat: 30.033333,
        lng: 31.233334),
    Hotel(
        name: 'Cairo Hotel',
        imageUrl:
            'https://th.bing.com/th/id/R.a587a778d25b5a5725d053d0b6d2dc54?rik=%2bhQil8NsVm%2bDPA&pid=ImgRaw&r=0',
        price: 1000,
        reviewsNumber: 40,
        stars: 5,
        locationCity: 'Cairo',
        lat: 31.033333,
        lng: 32.233334),
    Hotel(
        name: 'Luxor Hotel',
        imageUrl:
            'https://th.bing.com/th/id/R.a587a778d25b5a5725d053d0b6d2dc54?rik=%2bhQil8NsVm%2bDPA&pid=ImgRaw&r=0',
        price: 700,
        reviewsNumber: 50,
        stars: 3,
        locationCity: 'Luxor',
        lat: 33.033333,
        lng: 34.233334),
  ];
  List<Hotel> dummyList = [];

  @override
  void initState() {
    // TODO: implement initState
    hotels.forEach((element) {
      if (element.locationCity == widget.cityName) {
        dummyList.add(element);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
      ),
      body:GetBuilder<HotelsController>(builder: (_){
        return _hotelsController.hotelsList.isNotEmpty
        ? ListView.builder(
            itemCount: _hotelsController.hotelsList.length,
            itemBuilder: (BuildContext context, int index) {
              return hotelTileWidget(context, _hotelsController.hotelsList[index]);
            })
            : const Center(
        child: CircularProgressIndicator(color: Colors.indigo,),
        );
      },)
    );
  }
}
