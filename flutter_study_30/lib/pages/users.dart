import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersData extends StatefulWidget {
  const UsersData({super.key});

  @override
  State<UsersData> createState() => _UsersDataState();
}

class _UsersDataState extends State<UsersData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users Data"), elevation: 5),
      body: Container(
        margin: EdgeInsets.all(30),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (context, usersSnapshot) {
            if (usersSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: usersSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = usersSnapshot.data!.docs[index];
                return Card(
                  elevation: 8,
                  child: ListTile(
                    title: Text(doc["name"]),
                    subtitle: Text(doc["email"]),
                    trailing: Text("Age: ${doc["age"]}"),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
