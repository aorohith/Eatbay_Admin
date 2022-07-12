import 'package:eatbay_admin/controllers/add_product_controller.dart';
import 'package:eatbay_admin/models/product_model.dart';
import 'package:eatbay_admin/views/product_section.dart/edit_product.dart';
import 'package:eatbay_admin/views/widgets/big_text.dart';
import 'package:eatbay_admin/views/widgets/core/colors.dart';
import 'package:eatbay_admin/views/widgets/core/constant.dart';
import 'package:eatbay_admin/views/widgets/detail_image_view.dart';
import 'package:eatbay_admin/views/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProductDetailPage extends StatelessWidget {
  Product product;
  AdminProductDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final controller = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //image section
        DetailImageSection(
          imagePath: product.imageUrl,
        ),
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
            onClick: () {
              Get.back();
            },
          ),
          Row(
            children: [
              RoundButton(
                  icon: Icons.edit,
                  color: AppColors.mainColor,
                  onClick: () {
                    Get.to(EditProductPage(
                      product: product,
                    ));
                  }),
              w20,
              RoundButton(
                  icon: Icons.delete,
                  color: Colors.redAccent,
                  onClick: () {
                    Get.defaultDialog(
                      title: "Are you Sure to Delete?",
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.greenAccent),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.deleteProduct(product);
                            },
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.redAccent),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          )
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
                text: product.name,
                size: 25,
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: SizedBox(
                  child: Text(
                    product.description,
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
