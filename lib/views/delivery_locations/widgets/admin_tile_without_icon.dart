import 'package:eatbay_admin/views/widgets/big_text.dart';
import 'package:flutter/material.dart';

class AdminTileWithoutIcon extends StatelessWidget {
  String text;
  AdminTileWithoutIcon({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(text: text),
            ],
          ),
        ),
      ),
    );
  }
}
