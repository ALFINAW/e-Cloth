import 'package:e_cloth/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    super.key,
    required this.category
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          SizedBox(
            width: 70, 
            height: 70, 
            child: ClipOval(
              child: category.imageWidget,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.label,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
