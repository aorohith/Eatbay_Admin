import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatbay_admin/models/product_model.dart';
import 'package:get/get.dart';

class GetProductController extends GetxController {
   Stream<List<Product>> getProducts() => FirebaseFirestore.instance
      .collection('productlist')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

}
