import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText({
    Key? key,
    this.color =  const Color(0xff000000),
    required this.text,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: size,
          overflow: overflow,
          color: color,
          fontWeight: FontWeight.w400,
        )
      ),
      maxLines: 5,
      );
  }
}
