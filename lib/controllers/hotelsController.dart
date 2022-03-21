import 'package:get/get.dart';
import 'package:hotelbooking/models/hotels.dart';
import 'package:hotelbooking/services/http/hotels_services.dart';

class HotelsController extends GetxController {
  List<Hotel> hotelsList = [];

  getHotels(String city) async {
    List<Hotel> returnedList = await HotelsServices().getHotelByCity(city);
    if (returnedList.isEmpty) {
      hotelsList = [];
    } else {
      hotelsList = returnedList;
    }
    update();
  }
}
