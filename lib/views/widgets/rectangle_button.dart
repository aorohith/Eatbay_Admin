import 'package:flutter/material.dart';
import 'big_text.dart';

class RectangleButton extends StatelessWidget {
  BuildContext context;
  String text;
  Color bgColor;
  Color textColor;

  RectangleButton(
      {Key? key,
      required this.text,
      this.bgColor = const Color(0xFF42A5F5),
      this.textColor = const Color(0xffffffff),
      required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: bgColor),
        onPressed: () {},
        child: BigText(
          text: text,
          color: textColor,
        ),
      ),
    );
  }
}
