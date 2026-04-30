import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_study_30/functions/dbFunction.dart';
import 'package:flutter_study_30/widgets/todoList.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final _controller = TextEditingController();
  List toDoList = []; // Start empty and fetch from DB

  @override
  void initState() {
    super.initState();
    fetchTasks(); // Load data on startup
  }

  void fetchTasks() async {
    var snapshot = await FirebaseFirestore.instance
        .collection("TodoList")
        .orderBy("timestamp")
        .get();

    setState(() {
      toDoList = snapshot.docs
          .map((doc) => [doc['task'], doc['status'], doc.id])
          .toList();
    });
  }

  void saveNewTask() async {
    if (_controller.text.isEmpty) return;

    String taskText = _controller.text;
    _controller.clear(); // Clear UI immediately for better UX

    String newId = await createTodo(taskText, false);

    setState(() {
      toDoList.add([taskText, false, newId]);
    });
  }

  void checkBoxChanged(bool? value, int index) {
    String docId = toDoList[index][2];

    FirebaseFirestore.instance.collection("TodoList").doc(docId).update({
      'status': value,
    });

    setState(() {
      toDoList[index][1] = value;
    });
  }

  void deleteTask(int index) async {
    String docId = toDoList[index][2];

    await deleteTodo(docId); // Call DB function

    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo"),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) => ToDoList(
          taskName: toDoList[index][0],
          taskCompleted: toDoList[index][1],
          onChanged: (val) => checkBoxChanged(val, index),
          deleteFunction: (ctx) => deleteTask(index),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),

                    filled: true,
                    hintText: "Add new tasks.....",
                    fillColor: Colors.deepPurpleAccent.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurpleAccent,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurpleAccent,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: const Icon(Icons.add),
              backgroundColor: Colors.deepPurpleAccent,
              foregroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
