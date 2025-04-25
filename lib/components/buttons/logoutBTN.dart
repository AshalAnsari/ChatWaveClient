import 'package:flutter/material.dart';

Widget logoutBTN(double tSize, double iSize, double width) {
  return GestureDetector(
    onTap: () {
      print("Logging out");
    },
    child: Container(
      margin:
          EdgeInsets.symmetric(horizontal: width * 0.3, vertical: width * 0.02),
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Logout",
            style: TextStyle(
                color: Colors.black,
                fontSize: tSize,
                fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.login_outlined,
            size: iSize,
          )
        ],
      ),
    ),
  );
}
