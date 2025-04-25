import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/GlobalProvider/variables.dart';
import 'package:frontend/api/signUpAPI.dart' as checkIfFriendExist;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

class EmailInput extends StatefulWidget {
  String text;
  bool obscureText = false;
  EmailInput({required this.text, required this.obscureText});

  @override
  State<EmailInput> createState() => _MyInputFeildsState();
}

class _MyInputFeildsState extends State<EmailInput> {
  late TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void callback(BuildContext context, http.Response response) {
    var responseBody =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var message = responseBody['Message'];

    if (response.statusCode == 200) {
      String user_email = responseBody['Email'];
      context
          .read<Variables>()
          .checkIfEmailIsInDB(message.toString(), user_email);
    } else {
      context.read<Variables>().checkIfEmailIsInDB(message.toString(), "");
    }
  }

  void checkUser() {
    if (_controller.text.isNotEmpty) {
      Map<String, dynamic> data = {'email': _controller.text.toString()};
      checkIfFriendExist.postAPI("check_friend", context, data, callback);
    } else {
      print(_controller.text);
    }
  }

  void checkIfUserExist() {
    Timer(Duration(seconds: 3), checkUser);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[500],
          hintText: widget.text,
          hintStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(width: 1.5)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
                color: Colors.white, width: 1.5), // Thick black border on focus
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
                color: Colors.grey,
                width: 1.5), // Thick black border when enabled
          ),
        ),
        onChanged: (value) {
          checkIfUserExist();
        },
      ),
    );
  }
}
