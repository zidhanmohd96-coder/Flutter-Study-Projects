import 'package:firebase_auth/firebase_auth.dart';

signUp(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    print("User registered successfully: ${userCredential.user!.email}");
  } on FirebaseAuthException catch (e) {
    if (e.code == "weak-password") {
      print("The password provided is too weak.");
    } else if (e.code == "email-already-in-use") {
      print("The account already exists for that email.");
    }
  } catch (e) {
    print(e);
  }
}

signIn(String email, password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print("User signed in successfully: ${userCredential.user!.email}");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
