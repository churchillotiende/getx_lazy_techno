import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_techno/modules/product/controllers/product_controller.dart';
import 'package:lazy_techno/modules/routes/app_pages.dart';

class ProductView extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('product_list'.tr)),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (productController.errorMessage.isNotEmpty) {
          return Center(child: Text(productController.errorMessage.value));
        }
        return ListView.builder(
          itemCount: productController.productList.length,
          itemBuilder: (context, index) {
            final product = productController.productList[index];

            return ListTile(
              title: Text(product.title),
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
