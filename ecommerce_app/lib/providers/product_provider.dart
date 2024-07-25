// lib/providers/product_provider.dart
import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductProvider with ChangeNotifier {
  final ApiService apiService;
  List<Product> _products = [];
  bool _isLoading = false;

  ProductProvider(this.apiService);

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts(int limit, int offset) async {
    _isLoading = true;
    notifyListeners();

    try {
      final newProducts = await apiService.fetchProducts(limit, offset);
      _products.addAll(newProducts);
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
