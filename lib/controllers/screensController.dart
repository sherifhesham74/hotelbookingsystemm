import 'package:get/get.dart';

class ScreensController extends GetxController{
  RxInt screenIndex = 0.obs;

  navigateToBookings(){
    screenIndex = 1.obs;
  }
  navigateToCities(){
    screenIndex = 0.obs;
  }
  navigateToProfile(){
    screenIndex = 2.obs;
  }

}