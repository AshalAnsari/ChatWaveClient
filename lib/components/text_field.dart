import 'package:flutter/material.dart';

class TextFieldWithSend extends StatefulWidget {
  final TextEditingController controller;
  final String email;
  final Function performOperation;

  const TextFieldWithSend({
    Key? key,
    required this.controller,
    required this.email,
    required this.performOperation,
  }) : super(key: key);

  @override
  _TextFieldWithSendState createState() => _TextFieldWithSendState();
}

class _TextFieldWithSendState extends State<TextFieldWithSend> {
  bool _isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateTextState);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateTextState);
    super.dispose();
  }

  void _updateTextState() {
    setState(() {
      _isTextEmpty = widget.controller.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF262626),
      ),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              print("Plus button pressed!");
            },
            icon: Icon(Icons.add),
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height * 0.01),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.015),
            decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(
                    MediaQuery.sizeOf(context).width * 0.1)),
            width: MediaQuery.sizeOf(context).width * 0.7,
            child: TextField(
              controller: widget.controller,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.sizeOf(context).width * 0.05),
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          if (!_isTextEmpty)
            Container(
              decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(
                      MediaQuery.sizeOf(context).width * 0.5)),
              child: IconButton(
                onPressed: () {
                  widget.performOperation();
                },
                icon: Icon(
                  Icons.send,
                  color: Colors.grey[800],
                  size: MediaQuery.sizeOf(context).width * 0.07,
                ),
              ),
            )
          else
            IconButton(
                onPressed: () {
                  print("Camera button pressed!");
                },
                icon: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                )),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.001,
          )
        ],
      ),
    );
  }
}
