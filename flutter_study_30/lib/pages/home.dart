import 'package:flutter/material.dart';
import 'package:flutter_study_30/widgets/List_grid.dart';
import 'package:flutter_study_30/widgets/alert.dart';
import 'package:flutter_study_30/widgets/animatedText.dart';
import 'package:flutter_study_30/widgets/bottomNav.dart';
import 'package:flutter_study_30/widgets/bottomSheet.dart';
import 'package:flutter_study_30/widgets/button_elavated.dart';
import 'package:flutter_study_30/widgets/container_sized.dart';
import 'package:flutter_study_30/widgets/dismissible.dart';
import 'package:flutter_study_30/widgets/drawer.dart';
import 'package:flutter_study_30/widgets/dropdownlist.dart';
import 'package:flutter_study_30/widgets/form.dart';
import 'package:flutter_study_30/widgets/imagePicker.dart';
import 'package:flutter_study_30/widgets/images.dart';
import 'package:flutter_study_30/widgets/location.dart';
import 'package:flutter_study_30/widgets/rows_cols.dart';
import 'package:flutter_study_30/widgets/snackBar.dart';
import 'package:flutter_study_30/widgets/stack.dart';
import 'package:flutter_study_30/widgets/tabbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Map itemsMap = {
  'Items': [
    "Alert Widget",
    "Animated Text",
    "Bottom Navigation",
    "Bottom Sheet",
    "Elevated Button",
    "Container and SizedBox",
    "Dismissible",
    "Drawer",
    "DropDown List",
    "Form",
    "ImagePicker",
    "Images",
    "List Grid",
    "Location",
    "Rows and Columns",
    "Snackbar",
    "Stack",
    "Tabbar",
  ],
  'Details': [
    "Typically implemented via AlertDialog, this is a pop-up used for critical information or user confirmation.",
    "Uses packages like animated_text_kit to add effects like typing, fading, or scaling to text strings.",
    "A navigation bar displayed at the bottom of the app for switching between primary destinations.",
    "A surface that slides up from the bottom of the screen to reveal additional options or content.",
    "A Material Design button with a shadow that appears to lift when pressed.",
    "Container is a multipurpose styling box, while SizedBox is used for fixed dimensions or spacing.",
    "A widget that can be swiped in a specific direction to perform actions like deletion.",
    "A side menu that slides in from the edge of the screen for secondary navigation.",
    "A button that opens a menu for selecting a single value from a list of options.",
    "A container used to group and validate multiple input widgets like text fields.",
    "A plugin used to capture new photos with the camera or select existing ones from the gallery.",
    "A widget used to display graphics from assets, network, or local files.",
    "ListView and GridView are scrollable containers for linear or 2D arrays of widgets.",
    "Functionality used to retrieve the device's current geographic coordinates and permissions.",
    "The fundamental layout widgets for arranging children horizontally or vertically.",
    "A lightweight message that briefly appears at the bottom of the screen to provide feedback.",
    "A layout widget that positions its children on top of each other in layers.",
    "A horizontal row of tabs used to organize and navigate content sections.",
  ],
};
final List<Widget> screens = [
  AlertWidget(),
  AnimatedTextWidget(),
  BottomNav(),
  BottomSheetWidget(),
  ButtonWidget(),
  ContainerSized(),
  DismissibleWidget(),
  DrawerWidget(),
  DropDownList(),
  FormWidget(),
  ImagePickerWidget(),
  ImageWidget(),
  ListGridView(),
  LocationWidget(),
  RowsCols(),
  SnackBarWidget(),
  StackWidget(),
  TabBarWidget(),
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Widgets'), elevation: 8),
      body: Scaffold(
        body: Container(
          width: w,
          height: h,
          child: GridView.builder(
            itemCount: itemsMap['Items'].length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => screens[index]),
                    );
                  },
                  hoverColor: Colors.indigoAccent[70],
                  leading: Icon(Icons.info_outline),
                  title: Text(itemsMap['Items'][index]),
                  subtitle: Text(itemsMap['Details'][index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
