import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/home_header.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/search_header.dart'; // <-- NEW

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _searchCtl = TextEditingController();
  bool _showSearch = false;

  void _doSearch() {
    final q = _searchCtl.text.trim();
    if (q.isEmpty) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Searching for "$q"...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final pad = w * 0.04;
    const gap = 10.0;
    const tileHeight = 86.0;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: SizedBox(width: w * 0.74, child: const AppSideDrawer()),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _showSearch
                ? SearchHeader(
                    controller: _searchCtl,
                    onBack: () => setState(() {
                      _showSearch = false;
                      _searchCtl.clear();
                    }),
                    onSubmit: _doSearch,
                  )
                : HomeHeader(
                    onMenu: () => _scaffoldKey.currentState?.openDrawer(),
                    onSearch: () => setState(() => _showSearch = true),
                    onCart: () {},
                  ),
          ),

          // Title: Shop
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(pad, 14, pad, 8),
              child: const Text(
                'Shop',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          ),

          // Grid …
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: pad),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: tileHeight,
                crossAxisSpacing: gap,
                mainAxisSpacing: gap,
              ),
              delegate: SliverChildListDelegate.fixed([
                _ShopTile(
                  label: 'Brands',
                  right: const Text('A–Z',
                      style: TextStyle(color: Color(0xFF2A72FF), fontWeight: FontWeight.w700)),
                ),
                _ShopTile(label: 'Skin Care', right: const Icon(CupertinoIcons.sparkles, color: Color(0xFFFF6F61))),
                _ShopTile(label: 'Hair', right: const Icon(CupertinoIcons.wind, color: Color(0xFFFFB54C))),
                _ShopTile(label: 'Make Up', right: const Icon(CupertinoIcons.paintbrush, color: Color(0xFFFF6F61))),
                _ShopTile(label: 'Men', right: const Icon(CupertinoIcons.person, color: Color(0xFF6C7A89))),
                _ShopTile(label: 'Bath & Body', right: const Icon(CupertinoIcons.cube_box, color: Color(0xFFFFB54C))),
                _ShopTile(label: 'Korean Skincare', right: const Icon(CupertinoIcons.person_crop_circle_badge_checkmark, color: Color(0xFFFB6AA2))),
                _ShopTile(label: 'Beauty Under R200', right: const Icon(CupertinoIcons.bandage, color: Color(0xFFFF6F61))),
                _ShopTile(label: 'Mini Size', right: const Icon(CupertinoIcons.cube, color: Color(0xFF7BC5FF))),
                _ShopTile(label: 'Suncare', right: const Icon(CupertinoIcons.sun_max, color: Color(0xFFFFC83D))),
                _ShopTile(label: 'Book Skin Analysis', right: const Icon(CupertinoIcons.person_crop_circle, color: Color(0xFFB28B56))),
                _ShopTile(label: 'Sales & Offers', right: const Icon(CupertinoIcons.gift, color: Color(0xFFFF6F61))),
              ]),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverList.separated(
            itemCount: _featured.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (_, i) => Padding(
              padding: EdgeInsets.symmetric(horizontal: pad),
              child: _FeaturedCard(title: _featured[i], onTap: () {}),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}

// helpers unchanged…
class _ShopTile extends StatelessWidget {
  final String label;
  final Widget? right;
  const _ShopTile({required this.label, this.right, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) { /* same as before */ 
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFEDEDED), width: 1),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(children: [Expanded(child: Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87))), if (right != null) right!]),
        ),
      ),
    ); }
}

class _FeaturedCard extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const _FeaturedCard({required this.title, this.onTap});
  @override
  Widget build(BuildContext context) { /* same as before */ 
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFEDEDED)),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(children: [Expanded(child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87))), const Icon(CupertinoIcons.chevron_right, size: 18, color: Colors.black54)]),
        ),
      ),
    ); }
}

const _featured = [
  'Trending on Social', 'Only at BeautyOnTApp', 'New & Noteworthy',
  'Bestsellers', 'Glow Essentials', 'Bundles & Sets',
];
