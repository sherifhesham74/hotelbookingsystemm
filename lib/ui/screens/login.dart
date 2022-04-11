import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/controllers/usersController.dart';
import 'package:hotelbooking/services/http/clients_services.dart';
import 'package:hotelbooking/ui/screens/home_Screen.dart';
import 'package:hotelbooking/ui/screens/hotelOwner/reservations_Screen.dart';
import 'package:hotelbooking/ui/screens/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/shared_prefs.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool password = false;
  String role = '';

  final _formKey = GlobalKey<FormState>();
  UsersController _usersController = Get.put(UsersController());
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  checkuserrole()async{
    String? value = await SharedPrefs().checkRole();
    setState(() {
      role = value!;
    });
    print(value);
    if(role == 'client'){
      Get.off(HomeScreen());
    }
    else if(role == 'hotel'){
      Get.off(HotelReservationsScreen());
    }
    else{
      print('here');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(25.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Welcome To Our Hotel Booking Application',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Email",
                  suffixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value){
                  if(value == ''){
                    return 'Please Fill this Field';
                  }
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: !password,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Password",
                  suffixIcon: IconButton(
                    icon: password
                        ? Icon(
                            Icons.visibility,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                    onPressed: () {
                      setState(() {
                        password = !password;
                      });
                    },
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                validator: (value){
                  if(value == ''){
                    return 'Please Fill this Field';
                  }
                },
              ),
              SizedBox(
                height: 16,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 150.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurpleAccent),
                      padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    onPressed: () async{
                      if(_formKey.currentState!.validate()){
                        String response = await _usersController.userLogin(_emailController.text, _passwordController.text);
                        if(response == 'Email or Password invalid'){
                          const snackBar = SnackBar(
                            content: Text(
                              'Email or Password invalid',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar);
                        }
                        else {
                          checkuserrole();
                        }
                      }
                    }),
              ),
              SizedBox(
                height: 16,
              ),
              const Text(
                'Don\'t have an Email yet?',
                style: TextStyle(color: Colors.black),
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 150.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurpleAccent),
                      padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    onPressed: () {
                      Get.to(()=> Register());
                    }),
              ),
            ]),
          )),
    );
  }
}
