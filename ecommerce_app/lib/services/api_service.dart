// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> fetchProducts(int limit, int offset) async {
    final response = await http.get(Uri.parse('$baseUrl/products?limit=$limit&offset=$offset'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
