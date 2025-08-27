import 'package:beautyontapp/widgets/popular_item.dart';
import 'package:flutter/material.dart';

class PopularNowGrid extends StatelessWidget {
  final List<PopularItem> items;
  const PopularNowGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final pad = w * 0.04;
    // 4 columns on phones, responsive card size
    final itemW = (w - pad * 2 - 9 * 3) / 4; // 3 gaps of 9

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: pad),
      child: Wrap(
        spacing: 9,
        runSpacing: 12,
        children: items.map((e) {
          return SizedBox(
            width: itemW,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(e.imageAsset, fit: BoxFit.contain),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  e.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
