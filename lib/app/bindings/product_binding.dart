import 'package:get/get.dart';
import 'package:lazy_techno/app/services/product_service.dart';
import 'package:lazy_techno/modules/product/controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductService>(() => ProductService());
    Get.lazyPut<ProductController>(
      () => ProductController(productService: Get.find<ProductService>()),
    );
  }
}
