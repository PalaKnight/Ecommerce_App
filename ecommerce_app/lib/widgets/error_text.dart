import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(message, style: TextStyle(color: Colors.red, fontSize: 12),);
  }
}
