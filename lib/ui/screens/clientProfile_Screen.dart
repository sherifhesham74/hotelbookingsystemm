import 'package:flutter/material.dart';
import 'package:hotelbooking/services/http/clients_services.dart';
import 'package:hotelbooking/services/shared_prefs.dart';
import 'package:get/get.dart';

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

    getNameandEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                  if (nameController.text.isNotEmpty) {
                    setNewName(nameController.text);
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

  getNameandEmail() async {
    String returnedname = await SharedPrefs().getClientName();
    String returnedemail = await SharedPrefs().getClientEmail();
    setState(() {
      name = returnedname;
      email = returnedemail;
    });
  }

  setNewName(String name) async {
    int? userid = await SharedPrefs().getClientId();
    String newName = await ClientsServices().changeClientName(userid, name);
    setState(() {
      name = newName;
    });
  }
}
