import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiServices{
  startsDisplay(int starsnum){
    List<Widget> numOfStars = [];

    while (starsnum != 0) {
      numOfStars.add(Icon(
        Icons.star,
        color: Colors.amber,
        size: 25,
      ));
      starsnum = starsnum - 1;
    }
    return numOfStars;
  }

}