
import 'package:eatbay_admin/views/widgets/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      child: Center(child: SpinKitChasingDots(
        color: Colors.blueAccent,
        size: 50,
      )),
    );
  }
}