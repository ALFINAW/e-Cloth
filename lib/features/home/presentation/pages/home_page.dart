import 'package:e_cloth/features/home/data/data%20sources/category_data.dart';
import 'package:e_cloth/features/home/data/data%20sources/product_data.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MySearchField(
                  onChanged: (value) {},
                  onSubmitted: (value) {},
                ),
              ),
              const SizedBox(width: 16.0),
              SizedBox(
                width: 24.0,
                child: Assets.icons.cart.image(fit: BoxFit.fill),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          headingOne(title: 'Category', subtitle: 'See All'),
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
          headingOne(title: 'Today Sale!'),
          Expanded(child: ProductCard(products: products))
          // Menggunakan widget grid
        ]),
      ),
    );
  }
}
