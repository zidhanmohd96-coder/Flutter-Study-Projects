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
