import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  double height;
  SmallText({
    Key? key,
    this.color = const Color(0xffccc7c5),
    required this.text,
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
          textStyle: TextStyle(
        fontSize: size,
        color: color,
      )),
      maxLines: 1,
    );
  }
}
