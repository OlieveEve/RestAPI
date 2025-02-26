import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api/productAPI/productModel.dart';

class productAPI {
  Future getProducts() async {
    List productList = [];
    var response = await http.get(Uri.https('fakestoreapi.com', 'products'));
    if (response.statusCode == 200) {
      print(response.body);
      var jsonData = jsonDecode(response.body);
      for (var data in jsonData) {
        final product = Products(
            id: data['id'],
            title: data['title'],
            price: data['price'],
            description: data['description'],
            category: data['category'],
            image: data['image']);
        productList.add(product);
      }
      // print(productList.length);
    } else {
      throw Exception('Failed to load data');
    }
    return productList;
  }

  Future updateProduct(Products products) async {
    var response = await http.put(
        Uri.https('fakestoreapi.com', 'products/${products.id}'),
        body: jsonEncode(products));
    if (response.statusCode == 200) {
      return Products.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update data');
    }
  }
}
