import 'package:eatbay_admin/views/product_section.dart/admin_product_detail.dart';
import 'package:eatbay_admin/views/widgets/big_text.dart';
import 'package:eatbay_admin/views/widgets/icon_and_text_widget.dart';
import 'package:eatbay_admin/views/widgets/small_text.dart';
import 'package:flutter/material.dart';

class AdminProductList extends StatelessWidget {
  const AdminProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
      ),
      body: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminProductDetailPage(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://img.freepik.com/free-photo/big-hamburger-with-double-beef-french-fries_252907-8.jpg?w=2000'),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                text: "Fruit Meals",
                              ),
                              SmallText(text: "With cheeze"),
                              Row(
                                children: [
                                  IconAndTextWidget(
                                    icon: Icons.circle,
                                    iconColor: Colors.orange,
                                    text: 'Normal',
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.location_on,
                                    iconColor: Colors.green,
                                    text: '5 km',
                                  ),
                                  IconAndTextWidget(
                                    icon: Icons.timelapse,
                                    iconColor: Colors.red,
                                    text: '42min',
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
