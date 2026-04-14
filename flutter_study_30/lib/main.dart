import 'package:flutter/material.dart';
import 'package:flutter_study_30/ui/visacard_ui/pages/visacard_home.dart';
import 'package:flutter_study_30/ui/info_ui/simple_ui.dart';
import 'package:flutter_study_30/widgets/alert.dart';
import 'package:flutter_study_30/widgets/animatedText.dart';
import 'package:flutter_study_30/widgets/bottomNav.dart';
import 'package:flutter_study_30/widgets/bottomSheet.dart';
import 'package:flutter_study_30/widgets/dropdownlist.dart';
import 'package:flutter_study_30/widgets/form.dart';
import 'package:flutter_study_30/widgets/imagePicker.dart';
import 'package:flutter_study_30/widgets/location.dart';
import 'package:flutter_study_30/widgets/stack.dart';
import 'package:flutter_study_30/widgets/tabbar.dart';

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
        primaryColor: Colors.greenAccent,
        brightness: Brightness.dark,
      ),

      home: SimpleUI(),
    );
  }
}
