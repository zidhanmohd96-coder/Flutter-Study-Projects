import 'package:flutter/material.dart';
import 'package:fluttermoviez/screens/homeScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(primarySwatch: Colors.teal),
    );
  }
}
