import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_study_30/pages/home.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Henry_Cavill_at_the_2009_Tribeca_Film_Festival.jpg/250px-Henry_Cavill_at_the_2009_Tribeca_Film_Festival.jpg',
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Henry Cavill",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "henry.cavill@example.com",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(leading: Icon(Icons.home), title: Text("Home")),
              ListTile(
                leading: Icon(Icons.group),
                title: Text("Share with friends"),
              ),
              ListTile(leading: Icon(Icons.star), title: Text("Favorites")),
              ListTile(leading: Icon(Icons.delete), title: Text("Trash")),
              ListTile(leading: Icon(Icons.upload), title: Text("Upload")),
              ListTile(leading: Icon(Icons.folder), title: Text("My Files")),
              Divider(),
              ListTile(leading: Icon(Icons.share), title: Text("Share")),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Go Back"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Drawer Widget'),
        elevation: 8,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Drawer Widget demo."),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
