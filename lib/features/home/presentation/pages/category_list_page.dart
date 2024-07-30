import 'package:e_cloth/features/home/data/data%20sources/category_data.dart';
import 'package:e_cloth/features/home/presentation/pages/product_list_category_page.dart';
import 'package:e_cloth/features/home/presentation/widget/category_list.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 10),
        child: AppBar(
          title: const Text('Categories'),
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
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductListCategoryPage()),
                  ),
                  child: CategoryList(category: categories[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
