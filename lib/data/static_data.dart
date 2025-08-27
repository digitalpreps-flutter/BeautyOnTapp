import 'package:beautyontapp/widgets/popular_item.dart';
import 'package:beautyontapp/widgets/promo.dart';
import 'package:beautyontapp/widgets/offer.dart';
import '../models/product.dart';

const topCategories = [
  'Brands', 'Skin Care', 'Hair', 'Make Up', 'Men', 'Bath & Body'
];

/// Top promo cards (2 boxes) with image + text + CTA
const promosTop = [
  Promo(
    imageAsset: 'assets/images/promo1.png',
    title: 'All Skin Need Moisture',
    subtitle: 'Lock in Hydration all day with these light weight moistures',
    cta: 'SHOP NOW',
  ),
  Promo(
    imageAsset: 'assets/images/promo2.png',
    title: 'Restocked! Medicube',
    subtitle: 'Science backed formulas for clear, healthy, radiant skin.',
    cta: 'SHOP NOW',
  ),
];

/// Beauty Offers (different card style: white panel + black border)
const offersBeauty = [
  Offer(
    imageAsset: 'assets/images/offer1.png',
    title: 'Fade Dark Marks Faster With..',
    subtitle:
        'Get 20% off the Glutathione Dark Mark Serum • Replenish & Repair Barrier Serum',
    cta: 'SHOP NOW',
  ),
  Offer(
    imageAsset: 'assets/images/offer1.png', // second image
    title: 'Travel Sized Convenience',
    subtitle:
        'Targeted skincare, travel-sized convenience. Shop our breakthrough right now.',
    cta: 'SHOP NOW',
  ),
];

/// Chosen For You
const productsChosenForYou = [
  Product(
    id: 'p1',
    title: 'Axis - Y',
    subtitle: 'The Mini Glow Set',
    imageAsset: 'assets/images/p1.png',
    price: 320.0,
    rating: 4.7,
    reviews: 85,
  ),
  Product(
    id: 'p2',
    title: 'Pasty Skin Care',
    subtitle: 'Niacinamide Body Lotion',
    imageAsset: 'assets/images/p2.png',
    price: 320.0,
    rating: 4.9,
    reviews: 102,
  ),
  Product(
    id: 'p3',
    title: 'Acid Toner',
    subtitle: 'Niacinamide 2% Salicylic',
    imageAsset: 'assets/images/p2.png',
    price: 320.0,
    rating: 4.6,
    reviews: 63,
  ),
];

/// New Arrivals
const productsNewArrivals = [
  Product(
    id: 'n1',
    title: 'Axis - Y',
    subtitle: 'The Mini Glow Set',
    imageAsset: 'assets/images/new_arrival_1.png',
    price: 320.0,
    rating: 4.8,
    reviews: 90,
  ),
  Product(
    id: 'n2',
    title: 'Pasty Skin Care',
    subtitle: 'Niacinamide Body Lotion',
    imageAsset: 'assets/images/new_arrival_2.png',
    price: 320.0,
    rating: 4.7,
    reviews: 74,
  ),
  Product(
    id: 'n3',
    title: 'Acid Toner',
    subtitle: 'Niacinamide 2% Salicylic',
    imageAsset: 'assets/images/new_arrival_2.png',
    price: 320.0,
    rating: 4.5,
    reviews: 58,
  ),
];

/// “Check out What’s popular Now!” items (icons row/scroller)
const popularNow = <PopularItem>[
  PopularItem(title: 'Mini Size',        imageAsset: 'assets/images/pop_mini.png'),
  PopularItem(title: 'Active Body Care', imageAsset: 'assets/images/pop_mini.png'),
  PopularItem(title: 'Serums',           imageAsset: 'assets/images/pop_mini.png'),
  PopularItem(title: 'Body Care',        imageAsset: 'assets/images/pop_mini.png'),
  PopularItem(title: 'Face Masks',       imageAsset: 'assets/images/pop_mini.png'),
  PopularItem(title: 'Cleansers',        imageAsset: 'assets/images/pop_mini.png'),
  PopularItem(title: 'Toners',           imageAsset: 'assets/images/pop_mini.png'),
  PopularItem(title: 'Moisturisers',     imageAsset: 'assets/images/pop_mini.png'),
];

/// Brand logos (faded marquee/grid) – placeholders
const brandLogos = [
  'assets/images/pop_mini.png',
  'assets/images/pop_mini.png',
  'assets/images/pop_mini.png',
  'assets/images/pop_mini.png',
  'assets/images/pop_mini.png',
  'assets/images/pop_mini.png',
];

/// Footer (black section) helpers
const featureIcons = [
  {'title': 'Convenient', 'subtitle': 'Easy Payments, returns,\nand exchanges.'},
  {'title': 'Efficient',  'subtitle': 'We Deliver to your door\nwithin 24-72 hours'},
];

const footerStats = [
  {
    'title': 'Convenient',
    'subtitle': 'Easy Payments, returns,\nand exchanges.'
  },
  {
    'title': 'Efficient',
    'subtitle': 'We Deliver to your door\nwithin 24-72 hours'
  },
  {
    'title': 'Wide Variety',
    'subtitle': 'Over 1000 beauty\nproducts to shop on\none platform'
  },
  {
    'title': 'Find a BeautyOnTApp',
    'subtitle': 'Choose your Store'
  },
];

const footerCols = {
  'About Beauty': [
    'About Us',
    'Careers',
    'Brands on beauty On TApp',
    'Blogs',
    'Gift Vouchers'
  ],
  'My Beauty': [
    'Shop All',
    'Best Sellers',
    'Korean Skin Care',
    'MakeUp',
    'Hair Care'
  ],
  'Customer Service': [
    'Contact Us',
    'Log Return/ Exchange',
    'Refund & Return Policy',
    'Sell on BeautyOnTApp'
  ],
};

/// Footer contact info
const contactEmail = 'customer@beautyontapp.co.za';
const contactAddress =
    'Fourways Mall, Gateway Theatre of Shopping, Mall of Africa, Merlyn Park';

/// Drawer items (hamburger)
const drawerItems = [
  'Brands',
  'Skin Care',
  'Hair',
  'Make Up',
  'Men',
  'Bath & Body',
  'Korean Skin Care',
  'Beauty Under R200',
  'Mini Size',
  'Suncare',
  'Book Analysis',
  'Sales & offers',
];
