import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Widget searchBarWidget(BuildContext context,Function onChangedFunction){
  TextEditingController searchController = TextEditingController();
  return   Container(
    margin: const EdgeInsets.only(top: 10),

    width: MediaQuery.of(context).size.width * 0.95,
    child: TextField(
      onChanged: (value){
        onChangedFunction(value);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: "Search Cities",
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}