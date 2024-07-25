// lib/screens/home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce App'),
      ),
      body: PagedListView<int, Product>(
        pagingController: PagingController(firstPageKey: 0),
        builderDelegate: PagedChildBuilderDelegate<Product>(
          itemBuilder: (context, product, index) => ProductItem(product),
        ),
        fetchPage: (pageKey) async {
          try {
            await productProvider.fetchProducts(10, pageKey);
            productProvider.products.length < 10
              ? pagingController.appendLastPage(productProvider.products)
              : pagingController.appendPage(productProvider.products, pageKey + 10);
          } catch (error) {
            pagingController.error = error;
          }
        },
      ),
    );
  }
}
