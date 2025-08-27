import 'package:flutter/material.dart';
import '../widgets/promo.dart';
import 'promo_card.dart';

class PromoRow extends StatelessWidget {
  final List<Promo> items;
  final void Function(int index)? onTap;
  // optional custom colors for panels (cycle if fewer than items)
  final List<Color> panelColors;

  const PromoRow({
    super.key,
    required this.items,
    this.onTap,
    this.panelColors = const [Color(0xFFECA5BE), Color(0xFFDEC28A)],
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final pad = w * 0.04;
    final gap = 10.0;

    // two-column width but scrollable
    final cardW = (w - pad * 2 - gap) / 2;
    final imageH = cardW * 0.75;

    return SizedBox(
      height: imageH + 140, // image + content panel approx
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: pad),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(width: gap),
        itemBuilder: (_, i) => SizedBox(
          width: cardW,
          child: PromoCard(
            promo: items[i],
            imageHeight: imageH,
            contentColor: panelColors[i % panelColors.length],
            onTap: onTap == null ? null : () => onTap!(i),
          ),
        ),
      ),
    );
  }
}
