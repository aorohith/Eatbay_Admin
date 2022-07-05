import 'package:eatbay_admin/views/widgets/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class LoginButton extends StatelessWidget {
  String text;
  double textSize;
  Color color;
  Callback onClick;
  LoginButton({
    Key? key,
    this.textSize = 30,
    required this.text,
    required this.onClick,
    this.color = AppColors.mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 50,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: textSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
