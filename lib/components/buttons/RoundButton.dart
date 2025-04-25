import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String name;
  RoundButton({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Color(0xFFFF7043),
      ),
      padding: EdgeInsets.all(10),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFFFF7043)),
        ),
        onPressed: () {
          Navigator.pushNamed(context, './${name.toLowerCase()}');
        },
        child: Text(
          name,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
