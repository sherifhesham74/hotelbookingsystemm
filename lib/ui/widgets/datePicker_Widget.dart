import 'package:flutter/material.dart';

Widget DatePickerWidget(
    BuildContext context, TextEditingController controller,String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text,style: TextStyle(fontSize: 17,color: Colors.black87,fontWeight: FontWeight.bold),),
      const SizedBox(height: 5,),
      TextFormField(
        validator: (value){
          if(value == ''){
            return 'Please Fill this Field';
          }
        },
        readOnly: true,
        controller: controller,
        decoration: InputDecoration(
          hintText: "Choose Date",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: const Icon(Icons.date_range)
        ),
        onTap: () async {
          var date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 90)));
          if(date!=null){
            controller.text = date.toString().substring(0, 10);
          }

        },
      ),
    ],
  );
}
