import 'package:flutter/material.dart';
import 'package:frontend/GlobalProvider/SocketIO.dart';
import 'package:frontend/GlobalProvider/variables.dart';
import 'package:frontend/Screens/dashboard/Chat_List_Screen.dart';
import 'package:frontend/Screens/dashboard/Chat_Screen.dart';
import 'package:frontend/Screens/outside/HomeScreen.dart';
import 'package:frontend/Screens/outside/LoginScreen.dart';
import 'package:frontend/Screens/outside/SignupScreen.dart';
import 'package:frontend/Screens/outside/SplashScreen.dart';
import 'package:frontend/controller/Chat_Controller.dart';
import 'package:frontend/controller/User_Controller.dart';
import 'package:frontend/controller/navigation_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SocketIO()),
        ChangeNotifierProvider(create: (_) => ChatController()),
        ChangeNotifierProvider(create: (_) => NavigationController()),
        ChangeNotifierProvider(create: (_) => UserController()),
        ChangeNotifierProvider(create: (_) => Variables())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        './home': (context) => HomeScreen(),
        './login': (context) => LoginScreen(),
        './signup': (context) => SignupScreen()
      },
    );
  }
}
