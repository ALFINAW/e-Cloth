import 'package:e_cloth/features/home/data/data%20sources/product_data.dart';
import 'package:e_cloth/features/home/data/models/product_model.dart';
import 'package:e_cloth/features/home/presentation/pages/cart_page.dart';
import 'package:e_cloth/features/home/presentation/widget/dropdown.dart';
import 'package:e_cloth/features/home/presentation/widget/product_card.dart';
import 'package:e_cloth/features/home/presentation/widget/search_field.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  final List<Product> products;
  final String? searchHint;

  const ProductListPage({super.key, required this.products, this.searchHint});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String? selectedSize;
  String? selectedPrice;
  bool _isSingleColumn = false;
  List<Product> _displayedProducts = [];

  @override
  void initState() {
    super.initState();
    _displayedProducts = widget.products;
  }

  List<Product> searchProducts(String query) {
    final allProducts =
        todaySaleProduct + popularProduct + hoodiesProduct + flannelProduct;

    return allProducts.where((product) {
      final productTitleLower = product.title.toLowerCase();
      final searchLower = query.toLowerCase();
      return productTitleLower.contains(searchLower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _displayedProducts.isEmpty
              ? const Center(child: Text('No products found'))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 180.0),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ProductCard(
                          products: _displayedProducts,
                          isSingleColumn: _isSingleColumn,
                        ),
                      ),
                    ],
                  ),
                ),
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(
                    top: 40.0, bottom: 20, left: 5, right: 10),
                child: Row(
                  children: [
                    IconButton(
                      icon: Assets.icons.back.image(fit: BoxFit.cover),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: MySearchField(
                        hint: widget.searchHint,
                        onChanged: (value) {},
                        onSubmitted: (value) {
                          final searchResults = searchProducts(value);
                          setState(() {
                            _displayedProducts = searchResults;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    IconButton(
                      icon: Assets.icons.cart.image(fit: BoxFit.cover),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartPage()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Assets.icons.menu.image(fit: BoxFit.cover),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Filter",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    MyDropdown(
                      hint: 'Size',
                      value: selectedSize,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedSize = newValue;
                        });
                      },
                      items: const ['Option 1', 'Option 2', 'Option 3'],
                    ),
                    MyDropdown(
                      hint: 'Price',
                      value: selectedPrice,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedPrice = newValue;
                        });
                      },
                      items: const ['Option 1', 'Option 2', 'Option 3'],
                    ),
                    IconButton(
                      icon: _isSingleColumn
                          ? Assets.icons.gridtwo.image(fit: BoxFit.cover)
                          : Assets.icons.gridfour.image(fit: BoxFit.cover),
                      onPressed: () {
                        setState(() {
                          _isSingleColumn = !_isSingleColumn;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
