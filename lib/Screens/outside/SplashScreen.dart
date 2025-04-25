import 'package:flutter/material.dart';
import 'package:frontend/Functions/SplashServices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashServices().isLoggedIn(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        color: Color(0xFF262626),
        child: Image(
          image: AssetImage("assets/images/NewLogo_bg.jpg"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
