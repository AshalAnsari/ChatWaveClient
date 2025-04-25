import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/Screens/dashboard/navigation_screen.dart';
import 'package:frontend/Screens/outside/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices {
  void isLoggedIn(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = await prefs.getString('user_uid');
    if (userId != null) {
      String? email = await prefs.getString("email");
      Timer(const Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => WillPopScope(
              child: NavigationScreen(),
              onWillPop: () async => false,
            ),
          ),
          (route) => false,
        );
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => WillPopScope(
                  child: HomeScreen(), onWillPop: () async => false)),
          (route) => false,
        );
      });
    }
  }
}
