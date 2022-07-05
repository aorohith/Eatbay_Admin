import 'package:eatbay_admin/views/widgets/big_text.dart';
import 'package:eatbay_admin/views/widgets/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class PendingOrdersPage extends StatelessWidget {
  const PendingOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order_Id : #5454542"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://img.freepik.com/free-photo/juicy-american-burger-hamburger-cheeseburger-with-two-beef-patties-with-sauce-basked-black-space_124865-5964.jpg?w=2000"))),
              ),
              SizedBox(
                height: 20,
              ),
              _pendingTiles(text: "Ordered", onClick: () {}),
              _pendingTiles(text: "Prepared", onClick: () {}),
              _pendingTiles(
                  visible: true,
                  text: "Out for Delivery",
                  color: Colors.white,
                  onClick: () {}),
              _pendingTiles(
                  visible: true,
                  text: "Delivered",
                  color: Colors.white,
                  onClick: () {}),
            ],
          ),
        ),
      ),
    );
  }

  _pendingTiles({
    required String text,
    bool visible = false,
    Color color = AppColors.mainColor,
    required Callback onClick,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        color: color,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BigText(text: text),
              Visibility(
                visible: visible,
                child: GestureDetector(
                  onTap: onClick,
                  child: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Update",
                      ),
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

