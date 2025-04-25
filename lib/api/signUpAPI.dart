import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void postAPI(
  String apiEndpoint,
  BuildContext context,
  Map<String, dynamic> data,
  Function(BuildContext context, http.Response response) callback,
) async {
  try {
    var response = await http.post(
      Uri.parse("http://172.16.57.128:8000/user/$apiEndpoint"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: convert.jsonEncode(data),
    );
    callback(context, response);
  } catch (error) {
    print("Error on frontend: ${error}");
  }
}
