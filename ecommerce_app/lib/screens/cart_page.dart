// lib/screens/cart_page.dart
import 'package:flutter/material.dart';
import '../widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Add cart items here
                CartItem(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle checkout action
              },
              child: Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
