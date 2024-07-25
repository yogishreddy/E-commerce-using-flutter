// lib/widgets/cart_item.dart
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.network(
              'https://via.placeholder.com/100',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Title',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('\$10.00'),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                // Handle remove action
              },
            ),
          ],
        ),
      ),
    );
  }
}
