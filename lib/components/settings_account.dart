import 'package:flutter/material.dart';

Widget settingsAccount(
    String title, String subTitle, double tSize, double stSize) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 3),
        borderRadius: BorderRadius.circular(20)),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.yellow,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: tSize, color: Colors.white),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(fontSize: stSize, color: Colors.white),
      ),
    ),
  );
}
