import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay_admin/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  static AddProductController instance = Get.find();
  var isImagePathSet = false.obs;
  var productImagePath = ''.obs;
  final firebaseInstance = FirebaseFirestore.instance;
  var isLoading = false.obs;
  var imageUrl;

  void setProductImagePath(path) {
    productImagePath.value = path;
    isImagePathSet.value = true;
  }

  Future<void> addNewProduct(Product productdata) async {
    isLoading.value = true;
    var pathimage = productImagePath.value.toString();
    var temp = pathimage.lastIndexOf('/');
    var result = pathimage.substring(temp + 1);
    final ref =
        FirebaseStorage.instance.ref().child('product_images').child(result);
    var response = await ref.putFile(File(productImagePath.value));
    imageUrl = await ref.getDownloadURL(); //got the storage image url

    try {
      productdata.imageUrl = imageUrl;
      final docUser = firebaseInstance.collection('productlist').doc();
      productdata.id = docUser.id;
      final json = productdata.toJson();
      var response = await docUser.set(json);
      Get.back();
      Get.snackbar(
        "title",
        "Product Added",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (exception) {
      Get.snackbar(
        "title",
        exception.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoading.value = false;
    isImagePathSet.value = false;
    productImagePath.value = '';
    update();
  }

  Future<void> updateProduct(Product productdata) async {
    isLoading.value = true;
    if (isImagePathSet.value) {
      var pathimage = productImagePath.value.toString();
      var temp = pathimage.lastIndexOf('/');
      var result = pathimage.substring(temp + 1);
      final ref =
          FirebaseStorage.instance.ref().child('product_images').child(result);
      var response = await ref.putFile(File(productImagePath.value));
      imageUrl = await ref.getDownloadURL(); //got the storage image url
    }

    try {
      if (isImagePathSet.value) {
        productdata.imageUrl = imageUrl;
      }
      final data = productdata.toJson();
      final docUser = FirebaseFirestore.instance.collection('productlist').doc(productdata.id);
      docUser.update(data);

      // var response = await firebaseInstance.collection('productlist').add(data);
      Get.back();
      Get.snackbar(
        "title",
        "Product Updated",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (exception) {
      print(exception.toString());
      Get.snackbar(
        "title",
        exception.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoading.value = false;
    isImagePathSet.value = false;
    productImagePath.value = '';
    update();
  }

  deleteProduct(Product product){
    final docProduct = FirebaseFirestore.instance.collection('productlist').doc(product.id);
    docProduct.delete();
    Get.back();
  }
}
