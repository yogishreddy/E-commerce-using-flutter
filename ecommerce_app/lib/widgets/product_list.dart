// lib/widgets/product_list.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../providers/product_provider.dart';
import '../models/product.dart';
import 'product_item.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final PagingController<int, Product> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    try {
      await productProvider.fetchProducts(10, pageKey);
      final isLastPage = productProvider.products.length < 10;
      if (isLastPage) {
        _pagingController.appendLastPage(productProvider.products);
      } else {
        _pagingController.appendPage(productProvider.products, pageKey + 10);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Product>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Product>(
        itemBuilder: (context, item, index) => ProductItem(item),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
