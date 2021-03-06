import 'package:get/get.dart';
import 'package:hotelbooking/services/http/rooms_services.dart';

import '../models/photos.dart';

class RoomsController extends GetxController{



 getRoomsPhotoC(int id)async{
   List<Photo> photosList = [];
   List<Photo> returnedList = await RoomsServices().getRoomPhotos(id);
   if(returnedList.isNotEmpty){
     photosList = returnedList;
     print(photosList.length);
     return photosList;
   }
   else{
     print('empty');
   }
   update();
 }

 chooseNewRoomImage(int roomid,int photoid, String newpath)async{
   await RoomsServices().changeRoomPhoto(newpath, roomid, photoid);

 }

 deleteRoomC(int roomid)async{
   await RoomsServices().deleteRoom(roomid);
   update();
 }

}