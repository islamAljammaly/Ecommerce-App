import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  textTheme: const TextTheme(
      displayLarge:  TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
      bodyLarge:  TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),
      bodyMedium:  TextStyle(
          height: 2,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodySmall: TextStyle(height: 2, color: Colors.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
      bodyLarge:  TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
      bodyMedium:  TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black),
      bodySmall:  TextStyle(
          height: 1,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 10),
      displayLarge: TextStyle(height: 2, color: Colors.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);