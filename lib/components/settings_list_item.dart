import 'package:flutter/material.dart';

Widget settingsItem(
    String title, Function performAction, double vSize, double tSize) {
  return GestureDetector(
    onTap: () {
      print("Hello");
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: vSize),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: tSize),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
      ),
    ),
  );
}
