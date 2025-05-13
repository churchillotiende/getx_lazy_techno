import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_techno/modules/product/controllers/product_controller.dart';
import 'package:lazy_techno/routes/app_pages.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});

  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (productController.errorMessage.isNotEmpty) {
          debugPrint(productController.errorMessage.value);
          return Center(child: Text(productController.errorMessage.value));
        }

        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];

            return ListTile(
              title: Text(product.title),
              subtitle: Text('\$${product.price.toString()}'),
              onTap: () {
                Get.toNamed(Routes.productDetails, arguments: product);
                // INFO: Is like router.replace(), the current route wont be in history,
                // but all any previous stack will be maintained in the history stack
                // Get.offNamed(Routes.productDetails, arguments: product);

                // INFO: Is like router.replace(), no back button, and the history stack is cleared as well
                // Get.offAllNamed(Routes.productDetails, arguments: product);

                // INFO: using the class
                // Get.to(ClassNameView());
                // ...

                // INFO: Programmatic routing
                // onPressed: () { Get.back(); }
              },
            );
          },
        );
      }),
    );
  }
}
