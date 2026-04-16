import 'package:flutter/material.dart';
import 'package:flutter_study_30/functions/authFunction.dart';

class FirebaseAuthentication extends StatefulWidget {
  const FirebaseAuthentication({super.key});

  @override
  State<FirebaseAuthentication> createState() => _FirebaseAuthenticationState();
}

class _FirebaseAuthenticationState extends State<FirebaseAuthentication> {
  final _formKey = GlobalKey<FormState>();
  bool isLogin = false;
  String username = "";
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase Authentication"), elevation: 0),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !isLogin
                  ? TextFormField(
                      key: ValueKey("username"),
                      decoration: InputDecoration(
                        label: Text("Username"),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 3) {
                          return "Please enter username or username must be at least 3 characters long";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        username = value!;
                      },
                    )
                  : Container(),
              SizedBox(height: 20),
              TextFormField(
                key: ValueKey("email"),
                decoration: InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty || !value.contains("@")) {
                    return "Please enter a valid email address";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                key: ValueKey("password"),
                decoration: InputDecoration(
                  label: Text("Password"),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return "Please enter a strong password (at least 6 characters)";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      signUp(email, password);
                    }
                  },
                  child: isLogin ? Text("Sign In") : Text("Sign Up"),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  setState(() => isLogin = !isLogin);
                },
                child: isLogin
                    ? Text("Don't have an account? Sign Up")
                    : Text("Already have an account? Sign In"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
