import 'package:get/get.dart';
import 'package:lazy_techno/modules/product/controllers/product_controller.dart';
import 'package:lazy_techno/services/product_service.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    // INFO: Will initialize the controller when this dependency() is called.
    Get.lazyPut<ProductService>(() => ProductService());
    Get.lazyPut<ProductController>(
      () => ProductController(productService: Get.find<ProductService>()),
    );
  }
}
