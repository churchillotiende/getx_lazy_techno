import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lazy_techno/app/services/cart_service.dart';
import 'package:lazy_techno/modules/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  Get.put(CartService());
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
