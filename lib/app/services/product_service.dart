import 'dart:convert';

import 'package:getx_app/app/constants/AppConstants.dart';
import 'package:http/http.dart' as http;
import 'package:getx_app/app/modules/models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http
        .get(Uri.parse(Appconstants.BASE_URL + Appconstants.products));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);

      return data
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
