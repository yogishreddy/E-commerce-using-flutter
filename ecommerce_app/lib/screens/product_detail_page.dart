// lib/screens/product_detail_page.dart
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        children: [
          Image.network(product.image),
          Text(product.title),
          Text('\$${product.price}'),
          Text(product.description),
          Text('Rating: ${product.rating}'),
        ],
      ),
    );
  }
}
