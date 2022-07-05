import 'package:eatbay_admin/views/widgets/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class AdminDashboardTile extends StatelessWidget {
  IconData icon;
  String text;
  Callback onClick;
  Color color;
  String trailingText;
  AdminDashboardTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onClick,
    this.color = AppColors.mainColor,
    this.trailingText = "₹60L",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 50,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: color,
                    radius: 30,
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                ],
              ),
              Text(
                trailingText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
