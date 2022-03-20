
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{

  login(String name,String email,int id,String role)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('login', true);
    await pref.setString('name', name);
    await pref.setString('email', email);
    await pref.setString('role', role);
    await pref.setInt('id', id);
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

}