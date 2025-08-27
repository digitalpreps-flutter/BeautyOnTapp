import 'package:flutter/material.dart';

import '../../widgets/home_header.dart';
import '../../widgets/category_chips.dart';
import '../../widgets/product_scroller.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/search_header.dart'; // <-- NEW
import '../../data/static_data.dart';

class ExclusiveScreen extends StatefulWidget {
  const ExclusiveScreen({super.key});

  @override
  State<ExclusiveScreen> createState() => _ExclusiveScreenState();
}

class _ExclusiveScreenState extends State<ExclusiveScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _searchCtl = TextEditingController();
  bool _showSearch = false;

  void _doSearch() {
    final q = _searchCtl.text.trim();
    if (q.isEmpty) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Searching for "$q"...')));
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final pad = w * 0.04;

    final pastryCollection = productsChosenForYou;
    final mzuriCollection = productsNewArrivals;

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

          SliverToBoxAdapter(
            child: CategoryChips(
              categories: topCategories,
              margin: const EdgeInsets.only(top: 10),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),

          SliverToBoxAdapter(
            child: _SectionHeader(
              title: 'Pastry Collection',
              actionText: 'View All',
              onAction: () {},
              horizontalPadding: pad,
            ),
          ),
          SliverToBoxAdapter(
            child: ProductScroller(products: pastryCollection),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          SliverToBoxAdapter(
            child: _SectionHeader(
              title: 'Mzuri Skin Collection',
              actionText: 'View All',
              onAction: () {},
              horizontalPadding: pad,
            ),
          ),
          SliverToBoxAdapter(
            child: ProductScroller(products: mzuriCollection),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 18)),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback? onAction;
  final double horizontalPadding;

  const _SectionHeader({
    required this.title,
    this.actionText = 'View All',
    this.onAction,
    this.horizontalPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 4),
      child: Row(
        children: [
          Text(title,
              style: const TextStyle(fontSize: 16.5, fontWeight: FontWeight.w700)),
          const Spacer(),
          GestureDetector(
            onTap: onAction,
            child: const Text(
              'View All',
              style: TextStyle(
                fontSize: 13.5,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
