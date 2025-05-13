import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:lazy_techno/modules/product/models/product_model.dart';

class ProductService {
  final String apiUrl = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();
    } else {
      log(response.body);
      throw Exception(response.body);
    }
  }
}
