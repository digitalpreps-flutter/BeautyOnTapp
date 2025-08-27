class Product {
  final String id;
  final String title;
  final String subtitle;
  final String imageAsset;
  final double price;

  // NEW:
  final double rating;   // 0–5
  final int reviews;     // count

  const Product({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageAsset,
    required this.price,
    this.rating = 4.8,
    this.reviews = 95,
  });
}
