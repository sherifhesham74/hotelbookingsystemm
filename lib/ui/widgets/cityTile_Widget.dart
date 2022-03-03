import 'package:flutter/material.dart';
import 'package:hotelbooking/models/cities.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/ui/screens/hotels_Screen.dart';

Widget cityTileWidget(BuildContext context,City city) {
  return InkWell(
    onTap: (){
      Get.to(HotelsScreen(cityName: city.name));
    },
    child: Container(
      width: MediaQuery.of(context).size.width * 0.85,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 1)),
          ],
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.network(
              city.urlImage,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                 Expanded(
                    child: Text(
                  city.name,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
                RichText(
                  text: TextSpan(children: [
                    const WidgetSpan(
                        child: Icon(
                      Icons.location_on_rounded,
                      size: 15,
                      color: Colors.grey,
                    )),
                    TextSpan(
                        text: "${city.distance} KM from Cairo",
                        style: const TextStyle(color: Colors.grey))
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
