
import 'package:shared_preferences/shared_preferences.dart';

import 'http/clients_services.dart';

class SharedPrefs{

  login(String name,String email,int id,String role, String password, String photo, bool isdeleted, String address)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('login', true);
    await pref.setString('name', name);
    await pref.setString('email', email);
    await pref.setString('role', role);
    await pref.setInt('id', id);
    await pref.setString('password', password);
    await pref.setString('photo', photo);
    await pref.setBool('isdeleted', isdeleted);
    await pref.setString('address', address);
  }
  checkLogin()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? value = await pref.getBool('login');
    return value;
  }

  checkRole()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? value = await pref.getString('role');
    return value;
  }

  logout()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('login', false);
    await pref.setString('role', '');
  }

  Future<int> getClientId()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? id = await pref.getInt('id');
    return id!;
  }



  getClientName()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? name = await pref.getString('name');
    return name!;
  }

  setClientName(String name)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('name', name);
    return name;
  }

  setClientPhoto(String path)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('photo', path);
    return path;
  }

  getClientEmail()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? email = await pref.getString('email');
    return email!;
  }

  getClientPassword()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? password = await pref.getString('password');
    return password!;
  }

  getClientAddress()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? address = await pref.getString('address');
    return address!;
  }

  getClientisDeleted()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? isdeleted = await pref.getBool('isdeleted');
    return isdeleted!;
  }

  getClientPhoto()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? photo = await pref.getString('photo');
    return photo!;
  }

  getClientRole()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? role = await pref.getString('role');
    return role!;
  }

  setNewName(String name) async {
    int userid = await SharedPrefs().getClientId();
    String photo = await SharedPrefs().getClientPhoto();
    String address = await SharedPrefs().getClientAddress();
    String password = await SharedPrefs().getClientPassword();
    bool isdeleted = await SharedPrefs().getClientisDeleted();
    String role = await SharedPrefs().getClientRole();
    String email = await SharedPrefs().getClientEmail();
    String newName = await ClientsServices().changeClientName(
        userid, name, email, password, address, photo, isdeleted, role);
    await SharedPrefs().setClientName(name);
  }

}