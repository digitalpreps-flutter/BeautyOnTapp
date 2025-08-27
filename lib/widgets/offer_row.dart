import 'package:flutter/material.dart';
import 'offer.dart';
import 'offer_card.dart';

class OfferRow extends StatelessWidget {
  final List<Offer> items;
  final void Function(int index)? onTap;

  const OfferRow({super.key, required this.items, this.onTap});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final pad = w * 0.04;
    const gap = 8.0;

    final itemW = (w - pad * 2 - gap) / 2;
    final imageHeight = itemW * 0.72;
    final contentMinHeight = itemW * 1.05; // bigger than before -> no overflow

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: pad),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: itemW,
            child: OfferCard(
              offer: items[0],
              imageHeight: imageHeight,
              contentMinHeight: contentMinHeight,
              onTap: onTap == null ? null : () => onTap!(0),
            ),
          ),
          const SizedBox(width: gap),
          SizedBox(
            width: itemW,
            child: OfferCard(
              offer: items[1],
              imageHeight: imageHeight,
              contentMinHeight: contentMinHeight,
              onTap: onTap == null ? null : () => onTap!(1),
            ),
          ),
        ],
      ),
    );
  }
}
