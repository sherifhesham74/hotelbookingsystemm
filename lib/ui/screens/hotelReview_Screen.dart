import 'package:flutter/material.dart';
import 'package:hotelbooking/services/http/hotels_services.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/ui/screens/bookings_Screen.dart';

import 'home_Screen.dart';

class HotelReviewScreen extends StatefulWidget {
  const HotelReviewScreen({Key? key,required this.clientid,required this.hotelid}) : super(key: key);
  final int clientid;
  final int hotelid;

  @override
  _HotelReviewScreenState createState() => _HotelReviewScreenState();
}

class _HotelReviewScreenState extends State<HotelReviewScreen> {
  TextEditingController reviewController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(child: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                minLines: 5,
                  maxLines: 6,
                  controller: reviewController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Review",
                  suffixIcon: const Icon(Icons.rate_review),
                ),
                keyboardType: TextInputType.visiblePassword,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please Fill this Field';
                  }
                },
              ),
              const SizedBox(height: 20,),  ConstrainedBox(
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
                      "Add Review",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    onPressed: () async{
                     if(reviewController.text.isNotEmpty) {
                       String status = await HotelsServices().addHotelReview(
                           widget.clientid, widget.hotelid,
                           reviewController.text);
                       if (status == 'done') {
                         print(widget.clientid);
                         const snackBar = SnackBar(
                           content: Text(
                             'Review Added',
                             style: TextStyle(color: Colors.white),
                           ),
                           backgroundColor: Colors.green,
                         );
                         ScaffoldMessenger.of(context)
                             .showSnackBar(snackBar);
                       }
                       Get.to(HomeScreen());
                     }
                     else{
                       const snackBar = SnackBar(
                         content: Text(
                           'Please Enter Review',
                           style: TextStyle(color: Colors.white),
                         ),
                         backgroundColor: Colors.red,
                       );
                       ScaffoldMessenger.of(context)
                           .showSnackBar(snackBar);
                     }

                      }
                    ),
              ),

            ],
          ),
        ),
      )),
    );
  }
}
