import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Widget'),
        elevation: 8,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Henry_Cavill_at_the_2009_Tribeca_Film_Festival.jpg/250px-Henry_Cavill_at_the_2009_Tribeca_Film_Festival.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          // child: Image.network(
          //   'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Henry_Cavill_at_the_2009_Tribeca_Film_Festival.jpg/250px-Henry_Cavill_at_the_2009_Tribeca_Film_Festival.jpg',
          //   fit: BoxFit.cover,
          // ),
        ),
      ),
    );
  }
}
