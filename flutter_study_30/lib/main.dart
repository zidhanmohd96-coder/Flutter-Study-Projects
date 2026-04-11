import 'package:flutter/material.dart';
import 'package:flutter_study_30/widgets/alert.dart';
import 'package:flutter_study_30/widgets/animatedText.dart';
import 'package:flutter_study_30/widgets/bottomNav.dart';
import 'package:flutter_study_30/widgets/bottomSheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        brightness: Brightness.dark,
      ),

      home: BottomNav(),
    );
  }
}
