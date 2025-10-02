import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_techno/modules/product/controllers/cart_controller.dart';
import 'package:lazy_techno/modules/product/models/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  // const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('/cart');
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.name, style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text("\$${product.price}", style: TextStyle(fontSize: 24)),
            ElevatedButton(
                onPressed: () {
                  cartController.addToCart(product);
                  Get.snackbar(
                      'Added to cart', '${product.name} added to your cart');
                },
                child: Text('Add to cart'))
          ],
        ),
      ),
    );
  }
}
