import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_techno/modules/product/controllers/cart_controller.dart';
import 'package:lazy_techno/modules/routes/app_pages.dart';

void main() {
  // Get.put(CartController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      initialRoute: Routes.product,
      getPages: AppPages.routes,
    );
  }
}
