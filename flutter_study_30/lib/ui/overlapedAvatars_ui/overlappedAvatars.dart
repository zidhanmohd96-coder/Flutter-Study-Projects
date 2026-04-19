import 'package:flutter/material.dart';

class OverlappedAvatarUI extends StatelessWidget {
  OverlappedAvatarUI({Key? key}) : super(key: key);

  List avatarImages = [
    "https://png.pngtree.com/png-vector/20191101/ourmid/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGF0i5r1QKUhWAmaqbktOJL-FhXubowbbbqg&s",
    "https://static.vecteezy.com/system/resources/previews/004/477/337/non_2x/face-young-man-in-frame-circular-avatar-character-icon-free-vector.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCWOFXk4y0sZ1sdcBEEHKGdmAFXuSpafSP1Q&s",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Overlapped Circle avatars")),
      body: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < avatarImages.length; i++)
                    Align(
                      widthFactor: 0.5,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(avatarImages[i]),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 30),
              CircleAvatar(
                backgroundColor: Colors.transparent.withOpacity(0.2),
                radius: 50,
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
