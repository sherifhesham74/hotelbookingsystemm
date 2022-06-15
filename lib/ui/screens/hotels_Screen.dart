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
  List<Hotel> hotels = [];
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
              return hotelTileWidget(hotel :_hotelsController.hotelsList[index],);
            })
            : const Center(
        child: CircularProgressIndicator(color: Colors.indigo,),
        );
      },)
    );
  }
}
