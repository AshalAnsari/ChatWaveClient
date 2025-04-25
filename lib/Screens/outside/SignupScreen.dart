import 'package:flutter/material.dart';
import 'package:frontend/components/InputFields.dart';
import 'package:frontend/components/buttons/back_button.dart';
import 'package:frontend/components/buttons/execution_button.dart';
import 'package:frontend/components/buttons/signUpBTN.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF212121),
        leading: back_button(context, Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          color: Color(0xFF212121),
          child: Column(
            children: [
              Container(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  child: Image(
                      image: AssetImage('assets/images/newHomescreen.jpg'))),
              MyInputFeilds(
                  text: "Enter Your User Name",
                  controller: username,
                  obscureText: false),
              MyInputFeilds(
                  text: "Enter Your Email Address",
                  controller: email,
                  obscureText: false),
              MyInputFeilds(
                  text: "Enter Your Password",
                  controller: password,
                  obscureText: true),
              MyInputFeilds(
                  controller: confirmPassword,
                  text: "Confirm Password",
                  obscureText: true),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.015,
              ),
              signUpBtn(context, username.text, email.text, password.text,
                  confirmPassword.text)
            ],
          ),
        ),
      ),
    );
  }
}
