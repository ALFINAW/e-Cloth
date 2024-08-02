import 'package:e_cloth/features/home/data/data%20sources/product_data.dart';
import 'package:e_cloth/features/home/presentation/pages/product_detail_page.dart';
import 'package:e_cloth/features/home/presentation/widget/product_card.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ProductListCategoryPage extends StatefulWidget {
  const ProductListCategoryPage({super.key});

  @override
  State<ProductListCategoryPage> createState() =>
      _ProductListCategoryPageState();
}

class _ProductListCategoryPageState extends State<ProductListCategoryPage> {
  @override
  Widget build(BuildContext context) {
    final int productCount = hoodiesProduct.length;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 10),
        child: AppBar(
          title: Text('Hoodies ($productCount)'),
          leading: IconButton(
            icon: Assets.icons.back.image(fit: BoxFit.cover),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                Container(
                  color: Colors.grey,
                  height: 1.0,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProductDetailPage()),
            ),
            child: ProductCard(products: hoodiesProduct),
          ),
        ),
      ),
    );
  }
}
