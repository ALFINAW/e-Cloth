import 'package:e_cloth/features/home/data/data%20sources/category_data.dart';
import 'package:e_cloth/features/home/data/data%20sources/product_data.dart';
import 'package:e_cloth/features/home/data/models/product_model.dart';
import 'package:e_cloth/features/home/presentation/pages/cart_page.dart';
import 'package:e_cloth/features/home/presentation/pages/category_list_page.dart';
import 'package:e_cloth/features/home/presentation/pages/product_list_page.dart';
import 'package:e_cloth/features/home/presentation/widget/category_item.dart';
import 'package:e_cloth/features/home/presentation/widget/heading.dart';
import 'package:e_cloth/features/home/presentation/widget/product_card.dart';
import 'package:e_cloth/features/home/presentation/widget/search_field.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 100.0),
              headingOne(
                  title: 'Category',
                  subtitle: 'See All',
                  onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoryListPage()),
                        )
                      }),
              const SizedBox(height: 10.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    return CategoryItem(category: category);
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20.0),
              headingOne(title: 'Today Sale !'),
              const SizedBox(height: 10.0),
              ProductCard(products: todaySaleProduct),
              const SizedBox(height: 20.0),
              headingOne(title: 'Popular Products'),
              const SizedBox(height: 10.0),
              ProductCard(products: popularProduct),
              const SizedBox(height: 80.0),
            ]),
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
          padding:
              const EdgeInsets.only(top: 40.0, bottom: 20, left: 20, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MySearchField(
                  onChanged: (value) {},
                  onSubmitted: (value) {
                    final searchResults = searchProducts(value);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductListPage(products: searchResults, searchHint: value),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 5.0),
              IconButton(
                icon: Assets.icons.cart.image(fit: BoxFit.cover),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
