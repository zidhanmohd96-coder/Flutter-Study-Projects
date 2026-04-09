import 'package:flutter/material.dart';

class ListGridView extends StatefulWidget {
  const ListGridView({Key? key}) : super(key: key);

  @override
  State<ListGridView> createState() => _ListGridViewState();
}

class _ListGridViewState extends State<ListGridView> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    // List<String> items = [
    //   "Flutter",
    //   "Dart",
    //   "Widget",
    //   "Stateful",
    //   "Stateless",
    //   "ListView",
    //   "GridView",
    // ];
    Map itemsMap = {
      'Items': [
        "Flutter",
        "Dart",
        "Widget",
        "Stateful",
        "Stateless",
        "ListView",
        "GridView",
      ],
      'Details': [
        "Flutter is an open-source UI software development kit created by Google.",
        "Dart is a programming language optimized for building user interfaces.",
        "A widget is a basic building block of the Flutter UI.",
        "Stateful widgets are dynamic and can change their state during runtime.",
        "Stateless widgets are immutable and cannot change their state after being built.",
        "ListView is a scrollable list of widgets arranged linearly.",
        "GridView is a scrollable grid of widgets arranged in a 2D array.",
      ],
    };
    return Scaffold(
      appBar: AppBar(
        title: Text('List View and Grid View'),
        elevation: 8,
        backgroundColor: Colors.indigo,
      ),
      body: Scaffold(
        body: Container(
          width: w,
          height: h,
          // child: ListView.builder(
          //   itemCount: itemsMap['Items'].length,
          //   itemBuilder: (context, index) {
          //     return Card(
          //       child: ListTile(
          //         onTap: () {
          //           print("You tapped on ${itemsMap['Items'][index]}");
          //         },
          //         hoverColor: Colors.indigoAccent[70],
          //         leading: Icon(Icons.info_outline),
          //         title: Text(itemsMap['Items'][index]),
          //         subtitle: Text(itemsMap['Details'][index]),
          //       ),

          //       margin: EdgeInsets.all(8),
          //       elevation: 4,
          //     );
          //   },
          // ),
          // child: GridView(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3,
          //     mainAxisSpacing: 20,
          //     crossAxisSpacing: 20,
          //     childAspectRatio: 2 / 3,
          //   ),

          //   children: [
          //     Card(child: Center(child: Text("Flutter"))),
          //     Card(child: Center(child: Text("Flutter"))),
          //     Card(child: Center(child: Text("Flutter"))),
          //     Card(child: Center(child: Text("Flutter"))),
          //     Card(child: Center(child: Text("Flutter"))),
          //     Card(child: Center(child: Text("Flutter"))),
          //     Card(child: Center(child: Text("Flutter"))),
          //     Card(child: Center(child: Text("Flutter"))),
          //     Card(child: Center(child: Text("Flutter"))),
          //   ],
          // ),
          child: GridView.builder(
            itemCount: itemsMap['Items'].length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    print("You tapped on ${itemsMap['Items'][index]}");
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
