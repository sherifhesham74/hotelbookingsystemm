// import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:l1/models/validate.dart';
//
// import 'package:l1/screens/register.dart';
// import 'package:get/get.dart';
// class login extends StatefulWidget {
//   const login({Key? key}) : super(key: key);
//
//   @override
//   State<login> createState() => _loginState();
// }
//
// class _loginState extends State<login> {
//   Validate validate=Validate();
//
//
//   bool password=false;
//   @override
//   Widget build(BuildContext context) {
//
//
//
//
//     return Scaffold(
//
//
//
//           body: Container(
//
//               padding: EdgeInsets.all(25.0),
//
//             child: Form(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//
//               key: validate.formkey2,
//               child: Column(
//
//                 mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('Welcome To Our Hotel Booking Application',style: TextStyle(
//                       fontSize: 25.0,
//                       fontWeight: FontWeight.bold,
//
//                     ),),
//                  SizedBox(height: 30.0,),
//                  TextFormField(
//
//                   decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     filled: true,
//
//
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: "Email",
//                     suffixIcon: Icon(Icons.email),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: MultiValidator([
//                       EmailValidator(errorText: 'Not A Valid Email'),
//                     RequiredValidator(errorText: 'Required')
//                 ]
//                   ),
//
//                 ),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     TextFormField(
//                       obscureText: !password,
//
//                       decoration: InputDecoration(
//                         fillColor: Colors.white,
//                         filled: true,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         labelText: "Password",
//                         suffixIcon: IconButton(
//                           icon: password? Icon(Icons.visibility,color: Colors.black,):Icon(Icons.visibility_off,color: Colors.grey,),
//                             onPressed: () {
// setState(() {
//   password=!password;
// });
//                         },
//
//                         ),
//                       ),
//                       keyboardType: TextInputType.visiblePassword,
//
//                     validator: RequiredValidator(errorText: 'Required'),
//
//
//
//                     ),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     ConstrainedBox(
//                       constraints: BoxConstraints.tightFor(width: 150.0),
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                           shape: MaterialStateProperty.all(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                           ),
//                           backgroundColor:
//                           MaterialStateProperty.all(Colors.deepPurpleAccent),
//                           padding: MaterialStateProperty.all(EdgeInsets.all(14)),
//                         ),
//                         child:const Text(
//                           "Login",
//                           style: TextStyle(fontSize: 14, color: Colors.white),
//                         ),
//                         onPressed: (){
//
//                           validate.validate();}
//
//     ),
//     ),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     const Text('Don\'t hava Email yet?',style: TextStyle(color: Colors.black),),
//
//                     ConstrainedBox(
//                       constraints: BoxConstraints.tightFor(width: 150.0),
//                       child: ElevatedButton(
//                           style: ButtonStyle(
//                             shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
//                             backgroundColor:
//                             MaterialStateProperty.all(Colors.deepPurpleAccent),
//                             padding: MaterialStateProperty.all(EdgeInsets.all(14)),
//                           ),
//                           child:const Text(
//                             "Sign Up",
//                             style: TextStyle(fontSize: 14, color: Colors.white),
//                           ),
//                           onPressed: (){
//                             Get.to(Register());
//                             validate.validate();}
//
//                       ),
//                     ),
//     ]
//     ),
//     )
//
//           ),
//
//       );
//
//   }
// }
