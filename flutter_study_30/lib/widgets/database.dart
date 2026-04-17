import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_30/functions/dbFunction.dart';
import 'package:flutter_study_30/pages/users.dart';

class DatabaseOptions extends StatefulWidget {
  const DatabaseOptions({super.key});

  @override
  State<DatabaseOptions> createState() => _DatabaseOptionsState();
}

class _DatabaseOptionsState extends State<DatabaseOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database Options"),
        elevation: 5,
        actions: [
          IconButton(
            onPressed: () async {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  createData(
                    "users",
                    "user1",
                    "Nambiyar",
                    "nambiyar@example.com",
                    50,
                  );
                },
                child: Text("Create"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  updateData("users", "user1", "age", 25);
                },
                child: Text("Update"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UsersData()),
                  );
                },
                child: Text("Retrieve"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  deleteData("users", "user1");
                },
                child: Text("Delete"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
