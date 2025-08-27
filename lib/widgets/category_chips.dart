import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  final List<String> categories;
  final void Function(String)? onTap;
  final EdgeInsets margin;

  const CategoryChips({
    super.key,
    required this.categories,
    this.onTap,
    this.margin = const EdgeInsets.only(top: 10), // ↓ 10px from header
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;

    return Container(
      margin: margin,
      height: 42,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          return InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () => onTap?.call(categories[i]),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFE6E6E6), width: 1), // figma-ish
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                categories[i],
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }
}
