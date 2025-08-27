import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/static_data.dart'; // for drawerItems

class AppSideDrawer extends StatelessWidget {
  final void Function(String)? onSelect;
  const AppSideDrawer({super.key, this.onSelect});

  @override
  Widget build(BuildContext context) {
    final items = drawerItems; // from static_data.dart
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(CupertinoIcons.xmark, size: 22),
              onPressed: () => Navigator.of(context).pop(),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
                itemCount: items.length,
                separatorBuilder: (_, __) =>
                    const Divider(height: 1, color: Color(0xFFEDEDED)),
                itemBuilder: (_, i) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(6),
                    onTap: () {
                      Navigator.of(context).pop();
                      onSelect?.call(items[i]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        items[i],
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
