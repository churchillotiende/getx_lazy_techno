import 'package:get/get.dart';
import 'package:lazy_techno/modules/product/controllers/cart_controller.dart';
import 'package:lazy_techno/modules/product/controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    // INFO: Will initialize the controller when this dependency() is called.
    Get.put(ProductController());
    // INFO: Will reate an instance but not initialize, initialization only on Get.find()
    // When the page in question is "exited", then the controller is garbage collected
    Get.lazyPut<CartController>(() => CartController());
  }
}
