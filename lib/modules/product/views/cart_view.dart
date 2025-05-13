import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_techno/modules/product/controllers/cart_controller.dart';
import 'package:lazy_techno/modules/routes/app_pages.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),

      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('\$${item.price.toString()}'),
                    trailing: IconButton(
                      onPressed: () => cartController.removeFromCart(item),
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                  );
                },
              );
            }),
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total: \$${cartController.totalAmount.value.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
            );
          }),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.checkout);
            },
            child: Text('Proceed to Checkout'),
          ),
        ],
      ),
    );
  }
}
