import 'package:e_cloth/features/home/data/models/product_model.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

final List<Product> todaySaleProduct = [
  Product(
    imageWidget:
        Assets.images.longSleeveSquareFlannelShirt.image(fit: BoxFit.cover),
    title: 'Long Sleeve Square Flannel Shirt',
    category: 'Women',
    price: 'Rp. 300.000',
    discountedPrice: 'Rp. 200.000',
    isFavorite: true,
  ),
  Product(
    imageWidget: Assets.images.longSleeveFlannelShirt.image(fit: BoxFit.fill),
    title: 'Long Sleeve Flannel Shirt',
    category: 'Women',
    price: 'Rp. 300.000',
    discountedPrice: 'Rp. 200.000',
  ),
];

final List<Product> popularProduct = [
  Product(
    imageWidget:
        Assets.images.longSleeveSquareFlannelShirt.image(fit: BoxFit.fill),
    title: 'Long Sleeve Square Flannel Shirt',
    category: 'Women',
    price: 'Rp. 300.000',
    isFavorite: true,
  ),
  Product(
    imageWidget: Assets.images.longSleeveFlannelShirt.image(fit: BoxFit.fill),
    title: 'Long Sleeve Flannel Shirt',
    category: 'Women',
    price: 'Rp. 300.000',
  ),
  Product(
    imageWidget:
        Assets.images.joggerPantsUltraStretchDRYEX.image(fit: BoxFit.fill),
    title: 'Jogger pants Ultra Stretch DRY-EX',
    category: 'Man',
    price: 'Rp. 150.000',
    isFavorite: true,
  ),
  Product(
    imageWidget:
        Assets.images.taperedPantsUltraStretchDRYEX.image(fit: BoxFit.fill),
    title: 'Tapered Pants Ultra Stretch DRY-EX',
    category: 'Man',
    price: 'Rp. 250.000',
  ),
];

final List<Product> hoodiesProduct = [
  Product(
    imageWidget: Assets.images.mensFleecePulloverHoodie.image(fit: BoxFit.fill),
    title: 'Mens Fleece Pullover Hoodie',
    category: 'Men',
    price: 'Rp. 250.000',
  ),
  Product(
    imageWidget: Assets.images.mensIceDyePulloverHoodie.image(fit: BoxFit.fill),
    title: 'Mens Ice-Dye Pullover Hoodie',
    category: 'Men',
    price: 'Rp. 250.000',
  ),
  Product(
    imageWidget:
        Assets.images.fleecePulloverSkateHoodie.image(fit: BoxFit.fill),
    title: 'Fleece Pullover Skate Hoodie',
    category: 'Unisex',
    price: 'Rp. 250.000',
  ),
  Product(
    imageWidget: Assets.images.fleeceSkateHoodie.image(fit: BoxFit.fill),
    title: 'Fleece Skate Hoodie',
    category: 'Unisex',
    price: 'Rp. 250.000',
  ),
  Product(
    imageWidget:
        Assets.images.taperedPantsUltraStretchDRYEX.image(fit: BoxFit.fill),
    title: 'Celana Tapered Pants Ultra Stretch DRY-EX',
    category: 'Unisex',
    price: 'Rp. 250.000',
  ),
  Product(
    imageWidget:
        Assets.images.taperedPantsUltraStretchDRYEX.image(fit: BoxFit.fill),
    title: 'Celana Tapered Pants Ultra Stretch DRY-EX',
    category: 'Unisex',
    price: 'Rp. 250.000',
  ),
];

final List<Product> flannelProduct = [
  Product(
    imageWidget:
        Assets.images.longSleeveSquareFlannelShirt.image(fit: BoxFit.fill),
    title: 'Long Sleeve Square Flannel Shirt',
    category: 'Women',
    price: 'Rp. 300.000',
  ),
  Product(
    imageWidget:
        Assets.images.longSleeveSquareFlannelShirtPink.image(fit: BoxFit.fill),
    title: 'Long Sleeve Square Flannel Shirt Pink',
    category: 'Women',
    price: 'Rp. 300.000',
  ),
  Product(
    imageWidget:
        Assets.images.longSleeveSquareFlannelShirtBiru.image(fit: BoxFit.fill),
    title: 'Long Sleeve Square Flannel Shirt Biru',
    category: 'Women',
    price: 'Rp. 300.000',
  ),
  Product(
    imageWidget: Assets.images.longSleeveSquareFlannelShirtBiruTua
        .image(fit: BoxFit.fill),
    title: 'Long Sleeve Square Flannel Shirt Biru Tua',
    category: 'Women',
    price: 'Rp. 300.000',
  ),
  Product(
    imageWidget:
        Assets.images.longSleeveSquareFlannelShirtKrem.image(fit: BoxFit.fill),
    title: 'Long Sleeve Square Flannel Shirt Krem',
    category: 'Women',
    price: 'Rp. 300.000',
  ),
  Product(
    imageWidget: Assets.images.longSleeveFlannelShirt.image(fit: BoxFit.fill),
    title: 'Long Sleeve Flannel Shirt',
    category: 'Women',
    price: 'Rp. 300.000',
  ),
];
