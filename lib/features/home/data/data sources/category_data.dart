import 'package:e_cloth/features/home/data/models/category_model.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

final List<Category> categories = [
  Category(
    imageWidget: Assets.images.hoodies.image(fit: BoxFit.fill),
    label: 'Hoodies',
  ),
  Category(
    imageWidget: Assets.images.shorts.image(fit: BoxFit.fill),
    label: 'Shorts',
  ),
  Category(
    imageWidget: Assets.images.shoes.image(fit: BoxFit.fill),
    label: 'Shoes',
  ),
  Category(
    imageWidget: Assets.images.bag.image(fit: BoxFit.fill),
    label: 'Bag',
  ),
  Category(
    imageWidget: Assets.images.accessories.image(fit: BoxFit.fill),
    label: 'Accessories',
  ),
  
];
