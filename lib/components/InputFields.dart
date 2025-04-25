import 'package:flutter/material.dart';

class MyInputFeilds extends StatefulWidget {
  String text;
  TextEditingController? controller;
  bool obscureText = false;
  MyInputFeilds(
      {required this.text, this.controller, required this.obscureText});

  @override
  State<MyInputFeilds> createState() => _MyInputFeildsState();
}

class _MyInputFeildsState extends State<MyInputFeilds> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // Use the provided controller or create a new one if none is provided
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Dispose the local controller only if it was created within this widget
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: widget.controller,
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
      ),
    );
  }
}
