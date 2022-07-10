import 'package:eatbay_admin/controllers/get_products_controller.dart';
import 'package:eatbay_admin/models/product_model.dart';
import 'package:eatbay_admin/views/product_section.dart/admin_product_detail.dart';
import 'package:eatbay_admin/views/widgets/big_text.dart';
import 'package:eatbay_admin/views/widgets/icon_and_text_widget.dart';
import 'package:eatbay_admin/views/widgets/small_text.dart';
import 'package:flutter/material.dart';

class AdminProductList extends StatelessWidget {
   AdminProductList({Key? key}) : super(key: key);
  GetProductController controller = GetProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
      ),
      body: 
        StreamBuilder(
          stream: controller.getProducts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.hasError) {
              return Text("An error occured");
            } else if (snapshot.hasData) {
              final products = snapshot.data;
              return SafeArea(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: products!.length,
                  itemBuilder: (context, index) {
                    Product product = products[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminProductDetailPage(product:product),
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
                                  image:  DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        product.imageUrl),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                        text: product.name,
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
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      
    );
  }

}