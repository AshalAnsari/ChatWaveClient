import 'package:flutter/material.dart';
import 'package:frontend/Screens/dashboard/Add_A_Friend_Screen.dart';

myAppBar(BuildContext context) {
  var mediaquery = MediaQuery.sizeOf(context);
  return AppBar(
    backgroundColor: Color(0xFF262626),
    leading: IconButton(
        onPressed: () {
          print("Select Chats");
        },
        icon: Icon(
          Icons.more_horiz,
          size: mediaquery.width * 0.08,
          color: Colors.white,
        )),
    actions: [
      IconButton(
          onPressed: () {
            print("Camera Pressed!");
          },
          icon: Icon(
            Icons.camera_alt_rounded,
            size: mediaquery.width * 0.08,
            color: Colors.white,
          )),
      IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddAFriendScreen()));
          },
          icon: Icon(
            Icons.add_circle,
            size: mediaquery.width * 0.08,
            color: Colors.white,
          ))
    ],
  );
}
