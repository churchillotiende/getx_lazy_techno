import 'package:get/get.dart';
import 'package:lazy_techno/modules/product/models/product_model.dart';
import 'package:lazy_techno/services/product_service.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;
  var errorMessage = ''.obs;
  var isLoading = true.obs;

  final ProductService productService;

  ProductController({required this.productService});

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      errorMessage('');
      var products = await productService.fetchProducts();
      this.products.assignAll(products);
    } catch (e) {
      print(e);
      errorMessage('Failed to fetch products');
    } finally {
      isLoading(false);
    }
  }
}
