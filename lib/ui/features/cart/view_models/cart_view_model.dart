import 'package:flutter/foundation.dart';

import '../../../../domain/models/product.dart';

/// Represents a grouped product line item in the shopping cart.
class CartItem {
  final Product product;
  final int quantity;

  const CartItem({required this.product, required this.quantity});

  double get subtotal => product.price * quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(
      product: product,
      quantity: quantity ?? this.quantity,
    );
  }
}

/// Manages shopping cart state, item quantities, and total calculation.
class CartViewModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  bool get isEmpty => _items.isEmpty;

  int get totalCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.subtotal);

  void addProduct(Product product) {
    final index = _items.indexWhere(
      (item) => item.product.name == product.name,
    );
    if (index >= 0) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + 1,
      );
    } else {
      _items.add(CartItem(product: product, quantity: 1));
    }
    notifyListeners();
  }

  void decrementProduct(Product product) {
    final index = _items.indexWhere(
      (item) => item.product.name == product.name,
    );
    if (index < 0) return;

    final currentQty = _items[index].quantity;
    if (currentQty <= 1) {
      _items.removeAt(index);
    } else {
      _items[index] = _items[index].copyWith(quantity: currentQty - 1);
    }
    notifyListeners();
  }

  void removeProduct(Product product) {
    _items.removeWhere((item) => item.product.name == product.name);
    notifyListeners();
  }

  void clear() {
    if (_items.isEmpty) return;
    _items.clear();
    notifyListeners();
  }
}
