// import 'package:flutter/material.dart';
//
//
//
// class Profile extends StatefulWidget {
//
//
//   @override
//   _ProfileState createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.only(left: 15, top: 20, right: 15),
//         child: GestureDetector(
//           onTap: () {},
//
//           child: ListView(
//             children: [
//               Text('Add Hotel', textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 30),),
//               SizedBox(height: 10.0),
//               Center(child: Stack(
//                 children: [
//
//                   Container(
//                     width: 130,
//                     height: 130,
//                     decoration: BoxDecoration(
//                       border: Border.all(width: 4, color: Colors.white),
//                       boxShadow: [BoxShadow(
//                           spreadRadius: 2,
//                           blurRadius: 10,
//                           color: Colors.black.withOpacity(0.1)
//                       )
//                       ],
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         height: 40,
//                         width: 40,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                               width: 4,
//                               color: Colors.white
//                           ),
//                           color: Colors.blue,
//
//                         ),
//                         child: InkWell(
//                           child: Icon(
//                             Icons.add,
//                             color: Colors.white,
//                           ),
//                         ),
//
//
//                       )),
//
//
//                 ],
//               )
//
//                 ,),
//
//               SizedBox(height: 50.0,),
//               TextFormField(
//
//
//                 decoration: InputDecoration(
//                   fillColor: Colors.white,
//                   filled:true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   labelText: " Hotel Name ",
//                   suffixIcon: Icon(Icons.home),
//                 ),
//                 keyboardType: TextInputType.name,
//
//               ),
//               SizedBox(height: 15.0,),
//               TextFormField(
//
//
//                 decoration: InputDecoration(
//                   fillColor: Colors.white,
//                   filled:true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   labelText: "Location",
//                   suffixIcon: Icon(Icons.location_city),
//                 ),
//                 keyboardType: TextInputType.name,
//
//               ),SizedBox(height: 15.0,),
//               TextFormField(
//
//
//                 decoration: InputDecoration(
//                   fillColor: Colors.white,
//                   filled:true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   labelText: "Number of Rooms",
//                   suffixIcon: Icon(Icons.bedroom_parent),
//                 ),
//                 keyboardType: TextInputType.number,
//
//               ),
//               SizedBox(height: 50.0),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   OutlinedButton(
//                     onPressed: () {}, child: Text('Cancel', style: TextStyle(
//                     fontSize: 15.0,
//                     letterSpacing: 2,
//                     color: Colors.black,
//                   ),),
//                     style: OutlinedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(horizontal: 50.0),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20.0))
//                     ),
//                   ),
//                   ElevatedButton(onPressed: () {},
//                     child: Text('Save', style: TextStyle(
//                       fontSize: 15,
//                       letterSpacing: 2,
//                       color: Colors.white,
//                     ),),
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.blue,
//                         padding: EdgeInsets.symmetric(horizontal: 50),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20.0))
//                     ),
//                   )
//                 ],
//               ),
//
//
//
//             ],
//           ),
//         ),
//
//       ),
//     );
//   }    }
//
//
