import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Sheet'),
        elevation: 8,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "This is a typewriter animation",
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: Duration(milliseconds: 100),
                ),
              ],
              repeatForever: true,
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
              pause: Duration(milliseconds: 3000),
            ),
            // AnimatedTextKit(
            //   animatedTexts: [
            //     RotateAnimatedText(
            //       "This is a ",
            //       textStyle: TextStyle(
            //         fontSize: 24,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     RotateAnimatedText(
            //       "rotate animation",
            //       textStyle: TextStyle(
            //         fontSize: 24,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            //   repeatForever: true,
            // ),
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  "This is a wavy animation",
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              repeatForever: true,
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
              pause: Duration(milliseconds: 3000),
            ),
          ],
        ),
      ),
    );
  }
}
