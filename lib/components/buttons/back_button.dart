import 'package:flutter/material.dart';

Widget back_button(BuildContext context, Color color) {
  return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: color,
      ));
}
