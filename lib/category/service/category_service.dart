import 'dart:convert';
import 'package:snap_kart/category/model/category_model.dart';
import 'package:snap_kart/core/apiEndpoint.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<CategoryResponse>> fetchCategory() async {
    String url = ApiEndpoint.categoryProduct;
    final response = await http.get(Uri.parse(url),
        headers: {'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'});
    if (response.statusCode == 200) {
      final mapList = jsonDecode(response.body);
      List<CategoryResponse> categoryList = [];
      for (int i = 0; i < mapList.length; i++) {
        final category = mapList[i];
        categoryList.add(CategoryResponse.fromJson(category));
      }
      return categoryList;
    } else {
      throw ' category response =>${response.statusCode}';
    }
  }
}
