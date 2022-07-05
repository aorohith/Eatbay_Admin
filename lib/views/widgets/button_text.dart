import 'package:flutter/material.dart';

class CommonButtonText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const CommonButtonText({
    Key? key,
    required this.text,
    this.color = Colors.white,
    this.size = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
