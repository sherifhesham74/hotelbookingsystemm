

// import 'package:flutter/material.dart';
// class Reservations extends StatefulWidget {
//   const Reservations({Key? key}) : super(key: key);
//
//   @override
//   State<Reservations> createState() => _ReservationsState();
// }
//
// class _ReservationsState extends State<Reservations> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//
//         selectedItemColor: Colors.indigo,
//         unselectedItemColor: Colors.grey,
//
//
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.list),label: "Reservations"),
//
//           BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
//         ],
//       ),
//       body: SafeArea(
//         child: Container(
//
//           padding: EdgeInsets.only(top: 20.0),
//           color: Colors.white,
//           child: SingleChildScrollView(
//             child: Column(
//
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Card(
//                   shadowColor: Colors.black,
//                   color: Colors.white70,
//                   margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 25.0),
//                   child: ListTile(
//                     leading:                Icon(Icons.account_box,color: Colors.teal,),
//                     title: Text('Ahmed Magdi',style: TextStyle(
//                         fontSize: 23.0,color: Colors.teal.shade900,fontWeight: FontWeight.normal
//                     ),),
//                   ),
//                 ),
//                 Card(
//                   shadowColor: Colors.black,
//                   color: Colors.white70,
//                   margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 25.0),
//                   child: ListTile(
//                     leading:                Icon(Icons.bedroom_parent,color: Colors.teal,),
//                     title: Text('single',style: TextStyle(
//                         fontFamily: 'SourceSansPro',fontSize: 25.0,color: Colors.teal.shade900,fontWeight: FontWeight.normal
//                     ),),
//                   ),
//                 ),
//                 Card(
//                   shadowColor: Colors.black,
//                   color: Colors.white70,
//
//
//                   margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 25.0),
//                   child: ListTile(
//                     leading:               Icon(Icons.attach_money,color: Colors.teal),
//                     title: Text('200',style: TextStyle(
//                         fontSize: 25.0,color: Colors.teal.shade900,fontWeight: FontWeight.normal
//                     ),),
//                   ),
//                 ),
//                 ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor:  MaterialStateProperty.all(Colors.blue),
//                   ),
//                   onPressed: (){
//
//                   }, child: Text('Submit',style: TextStyle(color: Colors.white),),
//
//                 )
//
//
//
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//
//   }
// }
