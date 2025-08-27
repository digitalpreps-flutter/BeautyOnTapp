import 'package:flutter/material.dart';

import 'package:beautyontapp/widgets/offer_row.dart';
import '../../data/static_data.dart';
import '../../widgets/home_header.dart';
import '../../widgets/category_chips.dart';
import '../../widgets/section_title.dart';
import '../../widgets/promo_row.dart';
import '../../widgets/product_scroller.dart';
import '../../widgets/brand_marquee.dart';
import '../../widgets/footer_section.dart';
import '../../widgets/popular_now_scroller.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/search_header.dart'; // <-- NEW

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: SizedBox(width: w * 0.74, child: const AppSideDrawer()),
      body: CustomScrollView(
        slivers: [
          // 🔁 Swap the header
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

          // content …
          SliverToBoxAdapter(
            child: CategoryChips(
              categories: topCategories,
              margin: const EdgeInsets.only(top: 10),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(child: PromoRow(items: promosTop)),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(child: SectionTitle(title: 'Chosen For you', onShowMore: () {})),
          SliverToBoxAdapter(child: ProductScroller(products: productsChosenForYou)),
          SliverToBoxAdapter(child: SectionTitle(title: 'New Arrivals', onShowMore: () {})),
          SliverToBoxAdapter(child: ProductScroller(products: productsNewArrivals)),
          const SliverToBoxAdapter(child: SectionTitle(title: 'Beauty Offers')),
          SliverToBoxAdapter(child: OfferRow(items: offersBeauty)),
          const SliverToBoxAdapter(child: SizedBox(height: 18)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: const Text("Check out What's popular Now!",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            ),
          ),
          SliverToBoxAdapter(child: PopularNowScroller(items: popularNow)),
          SliverToBoxAdapter(child: BrandMarquee(logos: brandLogos)),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverToBoxAdapter(
            child: FooterSection(
              stats: footerStats,
              links: footerCols,
              email: contactEmail,
              address: contactAddress,
            ),
          ),
        ],
      ),
    );
  }
}
