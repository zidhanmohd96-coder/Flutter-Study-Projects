import 'package:flutter/material.dart';
import 'package:flutter_study_30/ui/visacard_ui/pages/visacard_content.dart';
import 'package:flutter_study_30/ui/visacard_ui/utils/visacard_color.dart';

class VisacardHome extends StatelessWidget {
  const VisacardHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(left: 18, right: 18, bottom: 100),
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(boxShadow: AppColors.shadows),
          child: VisacardContent(),
        ),
      ),
    );
  }
}
