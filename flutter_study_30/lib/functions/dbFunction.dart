import 'package:cloud_firestore/cloud_firestore.dart';

createData(String collName, docName, name, email, int age) async {
  await FirebaseFirestore.instance.collection(collName).doc(docName).set({
    "name": name,
    "email": email,
    "age": age,
  });
  print("Data created successfully");
}

updateData(String collName, docName, field, var newFieldValue) async {
  await FirebaseFirestore.instance.collection(collName).doc(docName).update({
    field: newFieldValue,
  });
  print("Data updated successfully");
}

deleteData(String collName, docName) async {
  await FirebaseFirestore.instance.collection(collName).doc(docName).delete();
  print("Data deleted successfully");
}

// Create task and return the unique ID
Future<String> createTodo(String task, bool isCompleted) async {
  DocumentReference docRef = await FirebaseFirestore.instance
      .collection("TodoList")
      .add({
        "task": task,
        "status": isCompleted,
        "timestamp": FieldValue.serverTimestamp(),
      });
  return docRef.id;
}

// Delete task using the ID
Future<void> deleteTodo(String docId) async {
  await FirebaseFirestore.instance.collection("TodoList").doc(docId).delete();
}
