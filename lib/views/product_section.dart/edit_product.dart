import 'dart:io';
import 'package:eatbay_admin/controllers/add_product_controller.dart';
import 'package:eatbay_admin/models/product_model.dart';
import 'package:eatbay_admin/views/widgets/core/constant.dart';
import 'package:eatbay_admin/views/widgets/shared/loading.dart';
import 'package:eatbay_admin/views/widgets/signin_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProductPage extends StatelessWidget {
  File? pickedFile;
  Product product;
  ImagePicker imagePicker = ImagePicker();

  EditProductPage({Key? key, required this.product}) : super(key: key);

  AddProductController addProductController = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: product.name);
    final priceController =
        TextEditingController(text: product.price.toString());
    final descriptionController =
        TextEditingController(text: product.description);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final add = AddProductController.instance;
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Obx(
                      () => Container(
                        height: 230,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: addProductController.isImagePathSet.value ==
                                    true
                                ? FileImage(File(addProductController
                                    .productImagePath.value)) as ImageProvider
                                : NetworkImage(product.imageUrl),
                          ),
                        ),
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
                        border: OutlineInputBorder(),
                        labelText: "Food Name",
                      ),
                      validator: (value) => _validateText(value),
                    ),
                    h20,
                    TextFormField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Price"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Are you sure?";
                        }
                      },
                    ),
                    h20,
                    SizedBox(
                      height: 100,
                      child: TextFormField(
                        controller: descriptionController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Description",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                        validator: (value) => _validateText(value),
                      ),
                    ),
                    h20,
                    Obx(() => add.isLoading.value
                        ? Loading()
                        : LoginButton(
                            text: "Update",
                            onClick: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              product.name = nameController.text.trim();
                              product.price = double.parse(priceController.text.trim());
                              product.description = descriptionController.text;
                              addProductController.updateProduct(product);
                            },
                          )),
                  ],
                ),
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

  _validateText(value) {
    if (value!.isNotEmpty && value.length > 2) {
      return null;
    } else if (value.length < 3 && value.isNotEmpty) {
      return 'No way, It is too short';
    } else {
      return 'Please input some data';
    }
  }
}
