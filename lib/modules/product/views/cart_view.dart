import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_techno/modules/product/controllers/cart_controller.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          Expanded(child: Obx(() {
            return ListView.builder(
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartController.cartItems[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toString()}'),
                  trailing: IconButton(
                      onPressed: () => cartController.removeFromCart(item),
                      icon: Icon(Icons.remove_circle_outline)),
                );
              },
            );
          })),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total:\$${cartController.totalAmount.value.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
            );
          }),
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/checkout');
                print("Checkout button has been pressed");
              },
              child: Text("Proceed to checkout"))
        ],
      ),
    );
  }
}
