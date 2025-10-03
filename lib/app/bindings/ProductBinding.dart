import 'package:get/get.dart';
import 'package:lazy_techno/modules/product/controllers/product_controller.dart';

class Productbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
