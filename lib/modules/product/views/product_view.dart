import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_techno/modules/product/controllers/product_controller.dart';
import 'package:lazy_techno/modules/routes/app_pages.dart';

class ProductView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: Obx(() {
        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];

            return ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price.toString()}'),
              onTap: () {
                Get.toNamed(Routes.productDetails, arguments: product);
              },
            );
          },
        );
      }),
    );
  }
}
