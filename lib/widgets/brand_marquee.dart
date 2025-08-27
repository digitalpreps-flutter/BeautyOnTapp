import 'package:flutter/material.dart';

class BrandMarquee extends StatelessWidget {
  final List<String> logos;
  const BrandMarquee({super.key, required this.logos});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final pad = w * 0.04;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: pad, vertical: 8),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 12,
        children: logos.map((p) {
          return Opacity(
            opacity: 0.35,
            child: SizedBox(
              width: (w - pad * 2) / 3 - 8, // 3 per row
              height: 34,
              child: Image.asset(p, fit: BoxFit.contain),
            ),
          );
        }).toList(),
      ),
    );
  }
}
