import 'package:flutter/material.dart';
import 'package:flutter_study_30/ui/visacard_ui/utils/visacard_text.dart';
import 'package:google_fonts/google_fonts.dart';

class VisacardContent extends StatelessWidget {
  const VisacardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            right: -150,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            left: -200,
            bottom: -470,
            child: Container(
              height: 600,
              width: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 15,
            child: Container(
              height: 30,
              child: Image.asset('assets/visacard_logo.png'),
            ),
          ),
          Positioned(
            top: 62,
            left: 25,
            child: modifiedtext(
              text: "it's where you want to be",
              color: Colors.grey.shade900,
              size: 14,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '5678 4356 0126 7800',
                  style: GoogleFonts.sourceCodePro(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  'Zidhan Muhammed',
                  style: GoogleFonts.sourceCodePro(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            child: Container(
              height: 80,
              child: Image.asset('assets/visacard_chip.png'),
            ),
          ),
        ],
      ),
    );
  }
}
