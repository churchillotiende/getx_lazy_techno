import 'package:get/get.dart';
import 'package:lazy_techno/modules/product/models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <ProductModel>[].obs;
  var totalAmount = 0.0.obs;

  void addToCart(ProductModel product) {
    cartItems.add(product);
  }

  void removeFromCart(ProductModel product) {
    cartItems.add(product);
  }
}
