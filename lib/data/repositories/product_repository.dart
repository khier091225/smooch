import '../../domain/models/product.dart';

/// Provides the Smooch Cafe product catalog and categories.
class ProductRepository {
  const ProductRepository();

  List<String> get categories => const ['All', 'Coffee', 'Tea', 'Pastries'];

  List<Product> get products => demoProducts;
}

const List<Product> demoProducts = [
  Product(
    name: 'Caramel Macchiato',
    price: 165,
    category: 'Coffee',
    description:
        'Rich espresso layered with steamed milk, velvety foam, '
        'and house-made caramel drizzle.',
    image: 'assets/images/caramel_macchiato.jpg',
  ),
  Product(
    name: 'Iced Spanish Latte',
    price: 155,
    category: 'Coffee',
    description:
        'Smooth double-shot espresso poured over chilled milk '
        'and sweetened condensed milk.',
    image: 'assets/images/spanish_latte.jpg',
  ),
  Product(
    name: 'Classic Americano',
    price: 120,
    category: 'Coffee',
    description:
        'Bold, aromatic espresso diluted with hot or cold filtered '
        'water for a clean, crisp finish.',
    image: 'assets/images/americano.jpg',
  ),
  Product(
    name: 'Iced Matcha Latte',
    price: 175,
    category: 'Tea',
    description:
        'Ceremonial-grade Japanese green tea whisked to order '
        'and served over creamy chilled milk.',
    image: 'assets/images/matcha_latte.jpg',
  ),
  Product(
    name: 'Peach Oolong Tea',
    price: 140,
    category: 'Tea',
    description:
        'Fragrant roasted oolong tea infused with sweet ripe '
        'peach nectar over crystal-clear ice.',
    image: 'assets/images/peach_oolong.jpg',
  ),
  Product(
    name: 'Butter Croissant',
    price: 110,
    category: 'Pastries',
    description:
        'Flaky, golden-brown French pastry baked fresh every '
        'morning with rich cultured butter.',
    image: 'assets/images/croissant.jpg',
  ),
  Product(
    name: 'Chocolate Muffin',
    price: 125,
    category: 'Pastries',
    description:
        'Moist double-chocolate bakery muffin loaded with '
        'melting dark chocolate chunks.',
    image: 'assets/images/chocolate_muffin.jpg',
  ),
  Product(
    name: 'Strawberry Cheesecake',
    price: 195,
    category: 'Pastries',
    description:
        'Creamy baked cheesecake topped with sweet strawberry '
        'compote on a buttery graham crust.',
    image: 'assets/images/strawberry_cheesecake.jpg',
  ),
];
