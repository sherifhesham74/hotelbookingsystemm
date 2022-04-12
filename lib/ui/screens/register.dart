import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/controllers/usersController.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool password = false;
  bool password2 = false;
  late String passwordtext = '';
  UsersController _usersController = Get.put(UsersController());

  final _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create An Account', textAlign: TextAlign.center),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 60, left: 16, right: 16),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  const Text(
                    "Hotel Booking",
                    style: TextStyle(fontSize: 20, color: Colors.black87),
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
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black)),
                      labelText: "Confirm Password",
                      suffixIcon: IconButton(
                        icon: password2
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
                            password2 = !password2;
                          });
                        },
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !password2,
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
                    constraints: BoxConstraints.tightFor(width: context.width),
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
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () async{
                        if (_formkey.currentState!.validate()) {
                          if (passwordController.text ==
                              confirmPasswordController.text) {
                            await _usersController.userRegister(nameController.text, emailController.text, passwordController.text);
                            if(_usersController.userExist == false.obs){
                              const snackBar = SnackBar(
                                content: Text(
                                  'Registered Successfully',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.green,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            else{
                              const snackBar = SnackBar(
                                content: Text(
                                  'Email already exist',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.indigo,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }

                          } else {
                            final snackBar = SnackBar(
                              content: Text(
                                'Please Enter Matched Passwords',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.redAccent,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
