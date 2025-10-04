import 'package:get/get.dart';
import 'package:lazy_techno/app/bindings/product_binding.dart';
import 'package:lazy_techno/modules/product/views/cart_view.dart';
import 'package:lazy_techno/modules/product/views/checkout_view.dart';
import 'package:lazy_techno/modules/product/views/product_details_view.dart';
import 'package:lazy_techno/modules/product/views/product_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.product,
        page: () => ProductView(),
        binding: ProductBinding()),
    GetPage(name: Routes.productDetails, page: () => ProductDetailsView()),
    GetPage(name: Routes.cart, page: () => CartView()),
    GetPage(name: Routes.checkout, page: () => CheckoutView()),
  ];
}
