import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';

  //Functions
  trySubmit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      submitForm();
    } else {
      print("Error in form");
    }
  }

  submitForm() {
    final snackbar = SnackBar(
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          print("You clicked on something");
        },
      ),
      duration: Duration(milliseconds: 3000),
      elevation: 6,
      content: Text("Form submitted successfully"),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    print("First Name: $firstName");
    print("Last Name: $lastName");
    print("Email: $email");
    print("Password: $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown List'),
        elevation: 8,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,

          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'First Name',
                  // labelText: 'First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                key: ValueKey('firstName'),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please enter your first name';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  firstName = value.toString();
                },
              ),
              SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  // labelText: 'Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                key: ValueKey('lastName'),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please enter your last name';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  lastName = value.toString();
                },
              ),
              SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  // labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                key: ValueKey('email'),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please enter your email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  email = value.toString();
                },
              ),
              SizedBox(height: 16),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  // labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                key: ValueKey('password'),
                validator: (value) {
                  if (value.toString().length <= 5) {
                    return 'Password must be at least 6 characters';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  password = value.toString();
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  trySubmit();
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
