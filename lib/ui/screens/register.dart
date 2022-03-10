// import 'package:flutter/painting.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:l1/models/validate.dart';
// class Register extends StatefulWidget {
//
//   @override
//   State<Register> createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
// Validate validate=Validate();
//
//
//
//   bool password=false;
//   bool password2=false;
//  late String passwordtext='';
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create An Account',textAlign: TextAlign.center),
//         backgroundColor: Colors.black,
//       ),
//
//       body: SafeArea(
//         child: Container(
//
//           margin: EdgeInsets.only(top: 60, left: 16, right: 16),
//           width: context.width,
//           height: context.height,
//           child: SingleChildScrollView(
//             child: Form(
//           key: validate.formkey2,
//
//               child: Column(
//                 children: [
//
//                   const Text(
//                     "Hotel Booking",
//                     style: TextStyle(fontSize: 20, color: Colors.black87),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//
//                     decoration: InputDecoration(
//                       fillColor: Colors.white,
//                       filled:true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       labelText: "Email",
//                       suffixIcon: Icon(Icons.email),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: MultiValidator([
//                       EmailValidator(errorText: 'Not A Valid Email'),
//                       RequiredValidator(errorText: 'Required'),
//
//
//                     ]
//                     ),
//
//
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   TextFormField(
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//
//
//                       decoration: InputDecoration(
//                       fillColor: Colors.white,
//                       filled: true,
//
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       labelText: "Password",
//                       suffixIcon: IconButton(
//                         icon: password? Icon(Icons.visibility,color: Colors.black,):Icon(Icons.visibility_off,color: Colors.grey,),
//                         onPressed: () {
//                           setState(() {
//                             password=!password;
//                           });
//                         },
//
//                       ),
//                     ),
//                     keyboardType: TextInputType.visiblePassword,
//                     obscureText: !password,
//                     onChanged: (val) => passwordtext = val,
//
//                     validator: MultiValidator([
//                       RequiredValidator(errorText: 'Required'),
//                       MinLengthValidator(8, errorText: 'Should Be At least 8 charcters')
//
//                     ]),
//
//
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   TextFormField(
//                    //autovalidateMode: AutovalidateMode.onUserInteraction,
//
//                     decoration: InputDecoration(
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(color: Colors.black)
//                       ),
//                       labelText: "Confirm Password",
//                       suffixIcon: IconButton(
//                         icon: password2? Icon(Icons.visibility,color: Colors.black,):Icon(Icons.visibility_off,color: Colors.grey,),
//                         onPressed: () {
//                           setState(() {
//                             password2=!password2;
//                           });
//                         },
//
//                       ),
//                     ),
//                     keyboardType: TextInputType.visiblePassword,
//                     obscureText: !password2,
//                     validator:(val) => MatchValidator(errorText: 'passwords do not match').validateMatch(val!, passwordtext),
//
//                   ),
//                   const SizedBox(
//                     height: 16,
//                   ),
//
//                   ConstrainedBox(
//                     constraints: BoxConstraints.tightFor(width: context.width),
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                         shape: MaterialStateProperty.all(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         backgroundColor:
//                         MaterialStateProperty.all(Colors.deepPurpleAccent),
//                         padding: MaterialStateProperty.all(EdgeInsets.all(14)),
//                       ),
//                       child: const Text(
//                         "Sign Up",
//                         style: TextStyle(fontSize: 14, color: Colors.white),
//                       ),
//                       onPressed: () {
//                   validate.validate();
//
//
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
