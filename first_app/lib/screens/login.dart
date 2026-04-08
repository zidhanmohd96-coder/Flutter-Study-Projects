import 'package:first_app/main.dart';
import 'package:first_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigoAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                  validator: (value) {
                    // if (_isDataMatched) {
                    //   return null;
                    // } else {
                    //   return 'Error';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Username';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    // if (_isDataMatched) {
                    //   return null;
                    // } else {
                    //   return 'Error';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Visibility(
                    visible: !_isDataMatched,
                    child: Text(
                      'Username and Password must be same.',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginCheck(context);
                    } else {
                      print('Data is Empty');
                    }

                    // loginCheck(context);
                  },
                  icon: Icon(
                    Icons.check,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  label: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 127, 146, 255),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginCheck(BuildContext ctx) async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username == password) {
      setState(() {
        _isDataMatched = true;
      });

      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenHome()));
    } else {
      final errorMessage = 'Username and Password do not match';
      setState(() {
        _isDataMatched = false;
      });
      // showDialog(
      //   context: ctx,
      //   builder: (buildCtx) {
      //     return AlertDialog(
      //       title: Text('Login Failed'),
      //       content: Text(errorMessage),
      //       actions: [
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(buildCtx).pop();
      //           },
      //           child: Text('Close'),
      //         ),
      //       ],
      //     );
      //   },
      // );
    }
  }
}
