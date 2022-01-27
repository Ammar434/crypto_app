import 'package:flutter/material.dart';

class UserContentToGive {
  // GetUserLevel
  int userLevel = 4;
  //setLevelList
  List<DropdownMenuItem<String>> setLevelList() {
    List<String> l = [];
    for (int i = 0; i <= 10; i++) {
      if (i < userLevel) {
        l.add("🔓 $i");
      } else {
        l.add("🔒 $i");
      }
    }
    return l.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
  //setVideoList

}
