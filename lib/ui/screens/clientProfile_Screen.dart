import 'package:flutter/material.dart';
import 'package:hotelbooking/services/http/clients_services.dart';
import 'package:hotelbooking/services/shared_prefs.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/services/ui_services.dart';
import 'dart:io';
import '../widgets/alertDialog_Widget.dart';
import 'login.dart';

class ClientProfileScreen extends StatefulWidget {
  const ClientProfileScreen({Key? key}) : super(key: key);

  @override
  _ClientProfileScreenState createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String name = '';
  String email = '';


  @override
  void initState() {
    // TODO: implement initState

    getClientInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                AlertDialogWidget(context);
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
                    FutureBuilder(
                      future: UiServices().getClientImage(),
                      builder:(BuildContext context, AsyncSnapshot snapshot){
                        if(snapshot.hasData){
                          String path = snapshot.data;
                          return path != "photo" ? ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.file(
                              File.fromUri(Uri.parse(
                                 path )),
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          ) : ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.asset(
                              "assets/images/profile.png",
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          );
                        }
                        else{
                          return CircularProgressIndicator();
                        }
                      }
                    ) ,
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
              height: 30,
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
                labelText: name,
                suffixIcon: const Icon(Icons.person),
              ),
              keyboardType: TextInputType.name,
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
                labelText: email,
                suffixIcon: const Icon(Icons.mail),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            RaisedButton(
                color: Colors.indigo,
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  getClientInfo();
                  if (nameController.text.isNotEmpty) {
                    SharedPrefs().setNewName(nameController.text);
                  }
                }),
            const SizedBox(
              height: 10,
            ),
            RaisedButton(
                color: Colors.red,
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  SharedPrefs().logout();
                  Get.off(Login());
                })
          ],
        ),
      ),
    ));
  }

  getClientInfo() async {
    String returnedname = await SharedPrefs().getClientName();
    String returnedemail = await SharedPrefs().getClientEmail();

    setState(() {
      name = returnedname;
      email = returnedemail;

    });
  }



  setNewName(String name) async {
    int userid = await SharedPrefs().getClientId();
    String photo = await SharedPrefs().getClientPhoto();
    String address = await SharedPrefs().getClientAddress();
    String password = await SharedPrefs().getClientPassword();
    bool isdeleted = await SharedPrefs().getClientisDeleted();
    String role = await SharedPrefs().getClientRole();
    String newName = await ClientsServices().changeClientName(
        userid, name, email, password, address, photo, isdeleted, role);
    setState(() {
      name = newName;
    });
  }


}
