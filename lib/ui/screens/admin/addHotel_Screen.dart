import "package:flutter/material.dart";
import 'package:hotelbooking/models/users.dart';
import 'package:hotelbooking/services/http/hotels_services.dart';
import 'dart:io';
import '../../../services/shared_prefs.dart';
import '../../../services/ui_services.dart';
import '../login.dart';
import 'package:get/get.dart';

class AddHotelScreen extends StatefulWidget {
  const AddHotelScreen({Key? key}) : super(key: key);

  @override
  _AddHotelScreenState createState() => _AddHotelScreenState();
}

class _AddHotelScreenState extends State<AddHotelScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController lngController = TextEditingController();
  bool password = false;
  bool password2 = false;
  late String passwordtext = '';
  String pathImage1 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    const Text(
                      "Hotel Details",
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        String path = await UiServices().chooseHotelImage();
                        setState(() {
                          pathImage1 = path;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 1)),
                          ],
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            pathImage1 != ""
                                ? ClipRRect(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                              child: Image.file(
                                File.fromUri(Uri.parse(pathImage1)),
                                width: 200,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                            )
                                : ClipRRect(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                              child: Image.network(
                                "https://th.bing.com/th/id/OIP.1tmbPfHMYVZGp-dgPvjm_wHaEJ?pid=ImgDet&rs=1",
                                width: 200,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                                width: 30,
                                height: 20,
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
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                  size: 20,
                                )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: nameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Name",
                        suffixIcon: const Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == '') {
                          return 'Please Fill this Field';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Email",
                        suffixIcon: const Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == '') {
                          return 'Please Fill this Field';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Password",
                        suffixIcon: IconButton(
                          icon: password
                              ? const Icon(
                            Icons.visibility,
                            color: Colors.black,
                          )
                              : const Icon(
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
                      obscureText: !password,
                      onChanged: (val) => passwordtext = val,
                      validator: (value) {
                        if (value == '') {
                          return 'Please Fill this Field';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: locationController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Location",
                        suffixIcon: const Icon(Icons.location_city),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == '') {
                          return 'Please Fill this Field';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: latController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Lat",
                        suffixIcon: const Icon(Icons.location_on_rounded),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == '') {
                          return 'Please Fill this Field';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: lngController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Lng",
                        suffixIcon: const Icon(Icons.location_on_rounded),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == '') {
                          return 'Please Fill this Field';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurpleAccent),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.all(14)),
                        ),
                        child: Text(
                          "Add Hotel",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formkey.currentState!.validate() && pathImage1 != "") {
                            Users user = Users(role: "hotel",
                                name: nameController.text,
                                password: passwordController.text,
                                email: emailController.text,
                                photo: pathImage1,
                                address: locationController.text,
                                lat: double.parse(latController.text),
                                lng: double.parse(lngController.text),
                                reservations: [],
                                reviewClient: [],
                                reviewHotels: [],
                                rooms: []);
                            await HotelsServices().addHotel(user);
                            const snackBar = SnackBar(
                              content: Text(
                                'Hotel Added Successfully',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.green,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor:
                          MaterialStateProperty.all(Colors.red),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.all(14)),
                        ),
                        child: Text(
                          "Logout",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        onPressed: () async {
                          await SharedPrefs().logout();
                          Navigator.pop(context);
                          Get.off(Login());

                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
