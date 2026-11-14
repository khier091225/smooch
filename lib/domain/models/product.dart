/// Domain model representing a menu item in Smooch Cafe.
class Product {
  final String name;
  final double price;
  final String category;
  final String description;
  final String image;

  const Product({
    required this.name,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });
}
