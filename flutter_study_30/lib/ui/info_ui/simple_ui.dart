import 'package:flutter/material.dart';

class SimpleUI extends StatelessWidget {
  const SimpleUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    // color: Colors.yellow,
                    height: 500,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            // color: Colors.red,
                            height: 465,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://media.istockphoto.com/id/527551774/photo/calle-de-alcala-in-madrid-spain.jpg?s=612x612&w=0&k=20&c=EOXE3QCPn7GCnytFJYdHNloWV4K9eLBPLI9Mm_Qqyg4=",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 15,
                          child: CircleAvatar(
                            radius: 38,
                            backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww",
                            ),
                          ),
                        ),
                        Positioned(
                          top: 25,
                          left: 25,
                          child: Icon(Icons.arrow_back_rounded, size: 30),
                        ),
                        Positioned(
                          top: 25,
                          right: 25,
                          child: Icon(Icons.favorite),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25, top: 10),

              child: Column(
                children: [
                  Text(
                    "Madrid City Tour for Designers",
                    style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "This is a random description of the tour. It is a very good tour and you should join it.",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade100),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  rowIconAndText('20', Icons.favorite_outline),
                  rowIconAndText('34', Icons.upload),
                  rowIconAndText('82', Icons.message),
                  rowIconAndText('295', Icons.face),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(25),

              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nisl nunc vel nisl. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nisl nunc vel nisl. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nisl nunc vel nisl. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nisl nunc vel nisl. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nisl nunc vel nisl. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nisl nunc vel nisl. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nisl nunc vel nisl. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nisl nunc vel nisl. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nisl nunc vel nisl. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nisl nunc vel nisl. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nisl nunc vel nisl. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nisl nunc vel nisl.",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowIconAndText(String text, IconData icon) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(width: 5),
        Icon(icon),
      ],
    );
  }
}
