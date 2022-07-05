import 'package:flutter/material.dart';

class IncreaseButton extends StatelessWidget {
  IconData icon;
  Color iconColor;
  IncreaseButton({
    Key? key,
    required this.icon,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Color(0xff94d500),
      child: IconButton(
        icon: Icon(
          icon,
          color: iconColor,
        ),
        onPressed: () {},
      ),
    );
  }
}
