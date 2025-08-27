import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Reusable Bottom Navigation (simple, no GetX)
/// - Pass currentIndex and onTap callback
/// - Labels: Home, Shop, Exclusive, Wishlist, Stores
/// - Black/white minimal styling like your Figma
class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const unselectedColor = Colors.black54;
    const selectedColor = Colors.black;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: selectedColor,
      unselectedItemColor: unselectedColor,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: selectedColor,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: unselectedColor,
      ),
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house),
          activeIcon: Icon(CupertinoIcons.house_fill),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.bag),
          activeIcon: Icon(CupertinoIcons.bag_fill),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.gift),
          activeIcon: Icon(CupertinoIcons.gift_fill),
          label: 'Exclusive',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.heart),
          activeIcon: Icon(CupertinoIcons.heart_solid),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.location),
          activeIcon: Icon(CupertinoIcons.location_solid),
          label: 'Stores',
        ),
      ],
    );
  }
}
