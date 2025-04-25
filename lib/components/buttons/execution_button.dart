import 'package:flutter/material.dart';
import 'package:frontend/Screens/dashboard/navigation_screen.dart';
import 'package:frontend/api/signUpAPI.dart';
import 'package:frontend/controller/navigation_controller.dart';
import 'package:frontend/model/User_Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

void callback(BuildContext context, http.Response response) {
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    Map<String, dynamic> body = jsonResponse['User'];
    UserModel user = UserModel.fromJson(body);
    Provider.of<NavigationController>(context, listen: false)
        .saveUserModel(user);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Login Successfull'),
      duration: const Duration(seconds: 2),
    ));
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WillPopScope(
          child: NavigationScreen(),
          onWillPop: () async {
            return false;
          });
    }));
  } else {
    // Handle other response statuses
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Login Failed'),
      duration: const Duration(seconds: 2),
    ));
  }
}

Widget executionButton(TextEditingController email, BuildContext context,
    String text, TextEditingController password) {
  return GestureDetector(
    onTap: () {
      // print("Email:${email.text}");
      Map<String, dynamic> data = {
        "email": email.text,
        "password": password.text
      };
      postAPI("/login", context, data, callback);
    },
    child: Container(
      decoration: BoxDecoration(
          color: Color(0xFFFF7043),
          borderRadius:
              BorderRadius.circular(MediaQuery.sizeOf(context).width * 0.5)),
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.02,
          horizontal: MediaQuery.sizeOf(context).width * 0.08),
      child: Text(
        "${text}",
        style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.sizeOf(context).width * 0.045),
      ),
    ),
  );
}
