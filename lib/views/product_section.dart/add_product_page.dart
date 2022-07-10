import 'dart:io';
import 'package:eatbay_admin/controllers/add_product_controller.dart';
import 'package:eatbay_admin/models/product_model.dart';
import 'package:eatbay_admin/views/widgets/core/constant.dart';
import 'package:eatbay_admin/views/widgets/signin_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatelessWidget {
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  AddProductPage({Key? key}) : super(key: key);

  AddProductController addProductController = Get.put(AddProductController());
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Obx(
                    () => Container(
                      height: 230,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: addProductController.isImagePathSet == true
                                  ? FileImage(File(addProductController
                                      .productImagePath.value)) as ImageProvider
                                  : const AssetImage(
                                      "assets/images/product_default_image.jpg"))),
                    ),
                  ),
                  h10,
                  Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            takeImage(ImageSource.camera);
                          },
                          icon: const Icon(Icons.camera),
                          label: const Text("Camera"),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            takeImage(ImageSource.gallery);
                          },
                          icon: const Icon(Icons.collections),
                          label: const Text("Gallery"),
                        ),
                      ],
                    ),
                  ),
                  h10,
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Food Name"),
                  ),
                  h20,
                  TextFormField(
                    controller: priceController,
                    
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Price"),
                  ),
                  h20,
                  SizedBox(
                    height: 200,
                    child: TextFormField(
                      controller: descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Description",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                    ),
                  ),
                  h20,
                  LoginButton(
                    text: "Add New",
                    onClick: () {
                      Product productData = Product(
                        name: nameController.text.trim(),
                        price: double.parse(priceController.text.trim()),
                        description: descriptionController.text,
                        imageUrl: "",
                      );

                      addProductController.addNewProduct(productData);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  takeImage(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    addProductController.setProductImagePath(pickedFile!.path);
  }
}
