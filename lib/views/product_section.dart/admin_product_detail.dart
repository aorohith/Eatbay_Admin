import 'package:eatbay_admin/views/product_section.dart/add_product_page.dart';
import 'package:eatbay_admin/views/widgets/big_text.dart';
import 'package:eatbay_admin/views/widgets/core/colors.dart';
import 'package:eatbay_admin/views/widgets/detail_image_view.dart';
import 'package:eatbay_admin/views/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProductDetailPage extends StatelessWidget {
  const AdminProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //image section
        const DetailImageSection(),
        //top buttons
        _topButtons(),
        //center descriptioin
        _bottomDescription(),
      ]),
    );
  }

  Padding _topButtons() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundButton(
            icon: Icons.arrow_back_ios_new,
            color: AppColors.mainColor,
            onClick: () {Get.back();},
          ),
          RoundButton(
              icon: Icons.edit,
              color: AppColors.mainColor,
              onClick: () {Get.to(AddProductPage());}),
        ],
      ),
    );
  }

  Align _bottomDescription() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 500,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: "Biriyani",
                size: 25,
              ),
              const SizedBox(
                height: 15,
              ),
              const Expanded(
                child: SizedBox(
                  child: Text(
                    "Typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
