import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_card.dart';

class ProductScroller extends StatelessWidget {
  final List<Product> products;
  const ProductScroller({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final pad = w * 0.04;

    // Card width responsive: small phones -> wider %, larger -> cap at 170
    final cardW = math.min(170.0, math.max(150.0, w * 0.44));

    // Image is square (cardW) + estimated content height
    const contentH = 128.0; // title+subtitle+rating+price+padding
    final scrollerH = cardW + contentH + 4; // tiny cushion to kill 0.xx overflow

    return SizedBox(
      height: scrollerH,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: pad, right: pad / 2),
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, i) => ProductCard(product: products[i], width: cardW),
      ),
    );
  }
}
