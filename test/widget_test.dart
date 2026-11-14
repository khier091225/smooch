import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:smooch/main.dart';

void main() {
  testWidgets('Smooch Cafe navigation and cart flow smoke test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SmoochCafeApp());

    // StartScreen renders store name and ORDER NOW button.
    expect(find.text('SMOOCH CAFE'), findsOneWidget);
    expect(find.text('ORDER NOW'), findsOneWidget);

    // Navigate to HomeScreen via Navigator.push().
    await tester.tap(find.text('ORDER NOW'));
    await tester.pumpAndSettle();

    expect(find.text('Smooch Cafe'), findsOneWidget);
    expect(find.text('Caramel Macchiato'), findsOneWidget);

    // Filter by Tea category.
    await tester.tap(find.text('Tea'));
    await tester.pumpAndSettle();

    expect(find.text('Iced Matcha Latte'), findsOneWidget);
    expect(find.text('Caramel Macchiato'), findsNothing);

    // Open ProductDetailsScreen and add to cart.
    final matchaFinder = find.text('Iced Matcha Latte');
    await tester.ensureVisible(matchaFinder);
    await tester.pumpAndSettle();
    await tester.tap(matchaFinder);
    await tester.pumpAndSettle();

    final addToCartFinder = find.text('ADD TO CART');
    expect(addToCartFinder, findsOneWidget);
    await tester.ensureVisible(addToCartFinder);
    await tester.pumpAndSettle();
    await tester.tap(addToCartFinder);
    await tester.pumpAndSettle();

    // Cart count badge should show 1.
    expect(find.text('1'), findsOneWidget);

    // Open CartScreen and verify item and total.
    await tester.tap(find.byIcon(Icons.shopping_cart));
    await tester.pumpAndSettle();

    expect(find.text('My Cart'), findsOneWidget);
    expect(find.text('Iced Matcha Latte'), findsOneWidget);
    expect(find.text('₱175.00'), findsNWidgets(2));
  });
}
