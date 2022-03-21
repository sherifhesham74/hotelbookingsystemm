import 'package:get/get.dart';
import 'package:hotelbooking/services/http/clients_services.dart';
import 'package:hotelbooking/services/http/hotels_services.dart';

import '../models/reviews.dart';


class ReviewsController extends GetxController {
  List<Review> reviewsList = [];

  getHotelReviews(int hotelid) async {
    reviewsList.clear();
    reviewsList = await HotelsServices().getHotelReviews(hotelid);
    if (reviewsList.isNotEmpty) {
      reviewsList.forEach((element) async{
        element.username = await ClientsServices().getuserNamebyId(element.userid!);
      });
    }
    update();
  }
}