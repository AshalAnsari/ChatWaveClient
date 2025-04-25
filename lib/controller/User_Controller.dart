import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/api/signUpAPI.dart';
import 'package:http/http.dart' as http;

class UserController extends ChangeNotifier {
  List<String> friends = [];

  void fetch_user_friends(String email, BuildContext context) {
    friends = [];
    Map<String, dynamic> data = {"email": email};
    print("fetching freinds");
    postAPI("get_friends", context, data, callback);
  }

  void callback(BuildContext context, http.Response response) {
    if (response.statusCode == 201) {
      var responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> fetchedFriends = responseBody['Friends'];
      fetchedFriends.forEach((friend) {
        if (friend is Map<String, dynamic> && friend.containsKey("Friend")) {
          saveUserFriends(friend['Friend']);
        }
      });
    }
  }

  void saveUserFriends(String friend) {
    friends.add(friend);
    notifyListeners();
  }
}
