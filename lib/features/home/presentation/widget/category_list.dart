import 'package:e_cloth/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final Category category;

  const CategoryList({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: 50,
                height: 50,
                child: category.imageWidget,
              ),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              child: Text(
                category.label,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
