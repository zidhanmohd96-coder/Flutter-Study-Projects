import 'package:flutter/material.dart';
import 'package:fluttertechnewz/utils/colors.dart';
import 'package:fluttertechnewz/utils/colors.dart';
import 'package:fluttertechnewz/utils/text.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  appbar({Key? key}) : preferredSize = Size.fromHeight(50.0), super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [],
      backgroundColor: AppColors.blackColor,
      elevation: 0,
      title: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoldText(text: 'Tech', size: 20, color: AppColors.primaryColor),
            ModifiedText(
              text: 'Newz',
              size: 20,
              color: AppColors.lightWhiteColor,
            ),
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}
