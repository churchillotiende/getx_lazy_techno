import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_techno/modules/routes/app_pages.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thank you for your purchase!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.product);
              },
              child: Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
