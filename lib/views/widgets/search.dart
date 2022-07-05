import 'package:eatbay_admin/views/widgets/core/colors.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.mainColor),
      child: const Icon(
        Icons.search,
        color: Colors.white,
      ),
    );
  }
}
