import 'dart:io';

import 'package:eatbay_admin/controllers/add_product_controller.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(() => Container(
                    height: 230,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: addProductController.isImagePathSet == true
                                ? FileImage(File(addProductController
                                    .productImagePath.value)) as ImageProvider
                                : NetworkImage(
                                    "https://img.freepik.com/free-photo/juicy-american-burger-hamburger-cheeseburger-with-two-beef-patties-with-sauce-basked-black-space_124865-5964.jpg?w=2000"))),
                  )),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        takeImage(ImageSource.camera);
                      },
                      icon: Icon(Icons.camera),
                      label: Text("Camera"),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        takeImage(ImageSource.gallery);
                      },
                      icon: Icon(Icons.collections),
                      label: Text("Gallery"),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Food Name"),
              ),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Price"),
              ),
              TextFormField(
                controller: descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Description",
                  contentPadding: EdgeInsets.symmetric(vertical: 45),
                ),
              ),
              LoginButton(
                  text: "Add New",
                  onClick: () {
                    Map<String, dynamic> productData = {
                      "p_name": nameController.text.trim(),
                      "p_price": priceController.text.trim(),
                      "p_upload_date": DateTime.now().millisecondsSinceEpoch,
                      "phone_number": descriptionController.text.trim()
                    };
                    addProductController.addNewProduct(productData);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  takeImage(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    addProductController.setProductImagePath(pickedFile!.path);
    print(addProductController.isImagePathSet);
  }
}
