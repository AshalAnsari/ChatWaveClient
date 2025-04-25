import 'package:flutter/material.dart';
import 'package:frontend/Screens/outside/LoginScreen.dart';
import 'package:frontend/api/signUpAPI.dart' as signUpAPI;
import 'package:http/http.dart' as http;

int checkConfirmPassword(String password, String confirmPassword) {
  if (confirmPassword == password) {
    return 1;
  }
  return 0;
}

void callback(BuildContext context, http.Response response) {
  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Sign Up Complete'),
      duration: const Duration(seconds: 2),
    ));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  } else {
    // Handle other response statuses
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Sign Up Failed'),
      duration: const Duration(seconds: 2),
    ));
  }
}

Widget signUpBtn(BuildContext context, String username, String email,
    String password, String confirmPassword) {
  return GestureDetector(
    onTap: () {
      int decider = checkConfirmPassword(password, confirmPassword);
      if (decider == 1) {
        Map<String, dynamic> data = {
          'username': username,
          'email': email,
          'password': password
        };
        // print("Data: $data");
        signUpAPI.postAPI("signup", context, data, callback);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Mismatch of password and confirm password'),
          duration: const Duration(seconds: 2),
        ));
      }
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
        "Sign Up",
        style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.sizeOf(context).width * 0.045),
      ),
    ),
  );
}
