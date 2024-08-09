import 'package:e_cloth/features/wishlist/presentation/widget/wishlist_item.dart';
import 'package:e_cloth/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final List<Map<String, dynamic>> products = [
    {
      'image': Assets.images.winterJacketByAdamScott.image(fit: BoxFit.cover),
      'title': 'Winter jacket by adam scott',
      'price': 500000
    },
    {
      'image': Assets.images.longSleeveSquareFlannelShirtBiru
          .image(fit: BoxFit.cover),
      'title': 'Long Sleeve Square Flannel Shirt',
      'price': 350000
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 10),
          child: AppBar(
            title: const Text('Wishlist'),
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
        body: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return WishlistItem(
                  imageWidget: product['image'],
                  title: product['title'],
                  price: product['price']);
            }));
  }
}
