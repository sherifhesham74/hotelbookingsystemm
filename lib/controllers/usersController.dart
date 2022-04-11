import 'package:get/get.dart';
import 'package:hotelbooking/models/users.dart';
import 'package:hotelbooking/services/http/clients_services.dart';

class UsersController extends GetxController {

  RxBool userExist = false.obs;


  userRegister(String name, String email, String password) async{
    Users user = Users(role: 'client',
        name: name,
        password: password,
        email: email,
        photo: 'photo',
        address: 'address',
        reservations: [],
        reviewClient: [],
        reviewHotels: [],
        rooms: []);
     await ClientsServices().clinetsRegister(user);
  }

  userLogin(String email,String password)async{
    String response  = await ClientsServices().clientsLogin(email, password);
    return response;
  }

}