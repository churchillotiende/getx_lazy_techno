import 'package:get/get.dart';
import 'package:lazy_techno/modules/product/controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    // INFO: Will reate an instance but not initialize, initialization only on Get.find()
    // When the page that triggered it's initialization is "exited", then the controller is garbage collected
    Get.lazyPut<CartController>(() => CartController());
  }
}
