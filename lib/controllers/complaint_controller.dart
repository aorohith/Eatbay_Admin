import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay_admin/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class ComplaintController extends GetxController {
  static ComplaintController instance = Get.find();
  var isImagePathSet = false.obs;
  var productImagePath = [''].obs;
  final firebaseInstance = FirebaseFirestore.instance;
  var isLoading = false.obs;
 

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
    var response = await ref.putFile(File(productImagePath.value[0]));
    var imageUrl = await ref.getDownloadURL(); //got the storage image url

    try {
      productdata.imageUrl = imageUrl;
      productdata.id = firebaseInstance.collection('productlist').doc().id;
      final data = productdata.toJson();
      var response = await firebaseInstance.collection('productlist').add(data);
      Get.back();
      Get.snackbar(
        "title",
        "Product Added",
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
    update();
  }
}
