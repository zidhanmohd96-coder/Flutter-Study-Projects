import 'package:flutter/material.dart';
import 'package:flutter_study_30/widgets/List_grid.dart';
import 'package:flutter_study_30/widgets/button_elavated.dart';
import 'package:flutter_study_30/widgets/container_sized.dart';
import 'package:flutter_study_30/widgets/dismissible.dart';
import 'package:flutter_study_30/widgets/drawer.dart';
import 'package:flutter_study_30/widgets/rows_cols.dart';
import 'package:flutter_study_30/widgets/snackBar.dart';

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

      home: DrawerWidget(),
    );
  }
}
