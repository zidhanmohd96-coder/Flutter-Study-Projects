import 'package:flutter/material.dart';
import 'package:fluttertechnewz/pages/home.dart';
import 'package:fluttertechnewz/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primaryColor,
      ),
      home: HomePage(),
    );
  }
}
