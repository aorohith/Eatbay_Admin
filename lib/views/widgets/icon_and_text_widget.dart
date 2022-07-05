import 'package:eatbay_admin/views/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {
  IconData icon;
  Color iconColor;
  String text;
  IconAndTextWidget({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.text,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor),
        const SizedBox(width: 5,),
        SmallText(text: text,)
      ],
    );
  }
}
