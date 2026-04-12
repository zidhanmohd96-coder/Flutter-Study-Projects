import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  const DropDownList({super.key});

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String selectedValue = 'Orange';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown List'),
        elevation: 8,
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 75,
            width: 300,
            // color: Colors.indigo,
            child: DropdownButton<String>(
              icon: Icon(Icons.arrow_drop_down_circle),
              isExpanded: true,
              value: selectedValue,
              items: <String>['Orange', 'Apple', 'Banana', 'Grapes'].map((
                String value,
              ) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
