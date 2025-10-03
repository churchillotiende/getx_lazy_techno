import 'package:get/get.dart';
import 'package:lazy_techno/app/services/cart_service.dart';
import 'package:lazy_techno/modules/product/models/product_model.dart';

class CartController extends GetxController {
  final CartService cartService = Get.find<CartService>();
  List<ProductModel> get cartItems => cartService.cartItems;
  var cartItems = <ProductModel>[].obs;
  double get totalAmount => cartService.totalAmount;

  void addToCart(ProductModel product) {
    cartService.addToCart(product);
  }

  void removeFromCart(ProductModel product) {
    cartService.removeFromCart(product);
  }
}
