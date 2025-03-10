import 'package:flutter/material.dart';

class CustomTitleHome extends StatelessWidget {
  final String title ; 
  const CustomTitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
            fontSize: 20,
            color: Colors.orange[400],
            fontWeight: FontWeight.bold));
  }
}