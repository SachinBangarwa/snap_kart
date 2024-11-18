import 'dart:convert';

import 'package:snap_kart/core/apiEndpoint.dart';
import 'package:snap_kart/product/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> fetchProduct() async {
    String url = ApiEndpoint.getProduct;
    final response = await http.get(Uri.parse(url),
        headers: {'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'});
    if (response.statusCode == 200) {
      final mapList = jsonDecode(response.body);
      List<Product> productList = [];
      for (int i = 0; i < mapList.length; i++) {
        final json = mapList[i];
        final product = Product.fromJson(json);
        productList.add(product);
      }
      return productList;
    }
    throw 'Unable found product';
  }
}
