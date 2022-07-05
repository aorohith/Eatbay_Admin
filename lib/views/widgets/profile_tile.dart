import 'package:eatbay_admin/views/widgets/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'big_text.dart';

class ProfileTiles extends StatelessWidget {
  IconData icon;
  String text;
  Callback onClick;
  Color color;
  ProfileTiles({
    Key? key,
    required this.icon,
      required this.text,
      required this.onClick,
      this.color = AppColors.mainColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color,
                radius: 22,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20),
              BigText(text: text),
            ],
          ),
        ),
      ),
    );
  }
}
