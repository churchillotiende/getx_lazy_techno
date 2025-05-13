import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_techno/modules/product/controllers/cart_controller.dart';
import 'package:lazy_techno/modules/product/models/product_model.dart';
import 'package:lazy_techno/routes/app_pages.dart';

class ProductDetailsView extends StatelessWidget {
  ProductDetailsView({super.key});

  // INFO: Get.find finds an instance of this controller that has been instantiated before
  // INFO: Get.put creates an instance of this controller in this view
  // calling .put again here will re-initialize the controller
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.toNamed(Routes.cart);
              // Get.offNamed(Routes.cart);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.name, style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text("\$${product.price}", style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                cartController.addToCart(product);
                Get.snackbar(
                  'Added to Cart',
                  '${product.name} added to your cart',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              },
              child: Text('Add to Cart'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    color: Colors.white,
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.shopping_cart),
                          title: Text('View Cart'),
                          onTap: () {
                            Get.toNamed(Routes.cart);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.payment),
                          title: Text('Proceed to Checkout'),
                          onTap: () {
                            Get.toNamed(Routes.checkout);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Text('More Actions'),
            ),
          ],
        ),
      ),
    );
  }
}
