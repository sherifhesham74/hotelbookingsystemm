import 'package:flutter/material.dart';

class ClientProfileScreen extends StatefulWidget {
  const ClientProfileScreen({Key? key}) : super(key: key);

  @override
  _ClientProfileScreenState createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 80),
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
              labelText: "Name",
              suffixIcon: const Icon(Icons.person),
            ),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 20,),
          TextFormField(
            controller: nameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: "Email",
              suffixIcon: const Icon(Icons.mail),
            ),
            keyboardType: TextInputType.emailAddress,

          ),
        ],
      ),
    ));
  }
}
