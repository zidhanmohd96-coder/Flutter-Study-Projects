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
          stream: FirebaseFirestore.instance.collection("TodoList").snapshots(),
          builder: (context, todoSnapshot) {
            if (todoSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: todoSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = todoSnapshot.data!.docs[index];
                return Card(
                  elevation: 8,
                  child: ListTile(
                    title: Text(doc["task"]),
                    subtitle: Text(doc["status"].toString()),
                    // trailing: Text("Age: ${doc["age"]}"),
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
