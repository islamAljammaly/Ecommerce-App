import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButtonHomeScreen extends StatelessWidget {
  final void Function()? onPress;
  final String textButton;
  final IconData iconData;
  final bool? active;
  const CustomButtonHomeScreen({super.key, required this.onPress, required this.textButton, required this.iconData, this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
            onPressed: onPress,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(iconData,color: active! ? Colors.amber[700] : Colors.black), Text(textButton,style: TextStyle(color: active! ? Colors.amber[700] : Colors.black),)],
            ),
          );
  }
}