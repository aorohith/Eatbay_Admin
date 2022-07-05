import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class AddProductController extends GetxController{

  var isImagePathSet = false.obs;
  var productImagePath = ''.obs; 
  final firebaseInstance = FirebaseFirestore.instance;

  void setProductImagePath(path){
    productImagePath.value = path;
    isImagePathSet.value = true;
  }


  Future<void> addNewProduct(Map productdata) async {
    var pathimage = productImagePath.value.toString();
    var temp = pathimage.lastIndexOf('/');
    var result = pathimage.substring(temp + 1);
    print(result);
    final ref =
        FirebaseStorage.instance.ref().child('product_images').child(result);
    var response = await ref.putFile(File(productImagePath.value));
    print("Updated $response");
    var imageUrl = await ref.getDownloadURL();

    try {
      // CommanDialog.showLoading();
      var response = await firebaseInstance.collection('productlist').add({
        'product_name': productdata['p_name'],
        'product_price': productdata['p_price'],
        'product_image': imageUrl,
      });
      print("Firebase response1111 $response");
      // CommanDialog.hideLoading();
      Get.back();
    } catch (exception) {
      // CommanDialog.hideLoading();
      print("Error Saving Data at firestore $exception");
    }
  }


}