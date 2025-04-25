import 'package:flutter/material.dart';
import 'package:frontend/components/InputFields.dart';
import 'package:frontend/components/buttons/back_button.dart';
import 'package:frontend/components/buttons/execution_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF212121),
        leading: back_button(context, Colors.white),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        color: Color(0xFF212121),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              decoration: BoxDecoration(color: Color(0xFF212121)),
              height: MediaQuery.sizeOf(context).height * 0.5,
              width: MediaQuery.sizeOf(context).width,
              child:
                  Image(image: AssetImage("assets/images/newHomescreen.jpg")),
            ),
            MyInputFeilds(
              text: "Enter Your Email",
              controller: username,
              obscureText: false,
            ),
            MyInputFeilds(
              text: "Enter Your Password",
              controller: password,
              obscureText: true,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.025,
            ),
            executionButton(username, context, "Login", password)
          ]),
        ),
      ),
    );
  }
}
