import 'package:flutter/material.dart';

class IconTextFiield extends StatelessWidget {
  IconData icon;
  String hintText;
  var controller;
  bool obscureText;

  IconTextFiield({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
