import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/GlobalProvider/variables.dart';
import 'package:frontend/api/signUpAPI.dart';
import 'package:frontend/components/InputFields.dart';
import 'package:frontend/components/email_input.dart';
import 'package:frontend/controller/User_Controller.dart';
import 'package:frontend/controller/navigation_controller.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AddAFriendScreen extends StatefulWidget {
  const AddAFriendScreen({super.key});

  @override
  State<AddAFriendScreen> createState() => _AddAFriendScreenState();
}

class _AddAFriendScreenState extends State<AddAFriendScreen> {
  void callback(BuildContext context, http.Response response) {
    var responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    var message = responseBody['Message'];

    context.read<Variables>().nullTheValues();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void addFriend() {
    var obj = Provider.of<Variables>(context, listen: false);
    var userController = Provider.of<UserController>(context, listen: false);
    String email = Provider.of<NavigationController>(context, listen: false)
        .user!
        .user_email;

    Map<String, dynamic> data = {
      "email": email,
      "friend_email": obj.friend_email,
    };

    postAPI("add_friend", context, data, callback);
    userController.saveUserFriends(obj.friend_email);
    obj.nullTheValues();
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: mediaquery.width,
          height: mediaquery.height,
          color: Color(0xFF262626),
          child: Column(
            children: [
              SizedBox(
                height: mediaquery.height * 0.03,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mediaquery.width * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel")),
                    TextButton(
                        onPressed: () {
                          if (Provider.of<Variables>(context, listen: false)
                                  .save ==
                              true) {
                            addFriend();
                            // print("saving");
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "You Cannot Save As User Is Not Available On CHATWAVE")));
                          }
                        },
                        child: Text("Save"))
                  ],
                ),
              ),
              SizedBox(
                height: mediaquery.height * 0.06,
              ),
              SizedBox(
                  width: mediaquery.width * 0.6,
                  child:
                      Image(image: AssetImage("assets/images/addfriend.png"))),
              SizedBox(
                height: mediaquery.height * 0.06,
              ),
              MyInputFeilds(text: "First name", obscureText: false),
              MyInputFeilds(text: "Last name", obscureText: false),
              EmailInput(text: "Email", obscureText: false),
              Text(
                "${context.watch<Variables>().userExistInCHATWAVE}",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
