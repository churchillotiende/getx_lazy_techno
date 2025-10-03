import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lazy_techno/modules/product/models/product_model.dart';

class CartService extends GetxService {
  final storage = GetStorage();
  var cartItems = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    List? storedCart = storage.read<List>('cartItems');
    if (storedCart != null) {
      cartItems
          .assignAll(storedCart.map((e) => ProductModel.fromJson(e)).toList());
    }

    ever(cartItems, (_) {
      storage.write('cartItems', cartItems.map((e) => e.tojson().toList()));
    });

    void addToCart(ProductModel product) {
      cartItems.add(product);
    }

    void removeFromCart(ProductModel product) {
      cartItems.remove(product);
    }

    void clearCart() {
      cartItems.clear();
    }
    double get totalAmount{
      return cartItems.fold(0,(sum,item) => sum + item.price);
    }
  }
}
