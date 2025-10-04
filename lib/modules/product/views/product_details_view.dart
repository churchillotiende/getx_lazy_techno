import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_techno/modules/product/controllers/cart_controller.dart';
import 'package:lazy_techno/modules/product/models/product_model.dart';
import 'package:lazy_techno/modules/routes/app_pages.dart';

class ProductDetailsView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  // const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('product_details'.tr),
        actions: [
          IconButton(
              onPressed: () {
                print("Button clicked");
                print("Current route: ${Get.currentRoute}");
                print("Navigating to: ${Routes.cart}");
                Get.toNamed('/cart');
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.title, style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text("\$${product.price}", style: TextStyle(fontSize: 24)),
            ElevatedButton(
                onPressed: () {
                  cartController.addToCart(product);
                  Get.snackbar(
                    'Added to cart',
                    '${product.title} added to your cart',
                    snackPosition: SnackPosition.BOTTOM,
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                },
                child: Text('Add to cart'))
          ],
        ),
      ),
    );
  }
}
