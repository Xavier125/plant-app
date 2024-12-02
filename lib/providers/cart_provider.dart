import 'package:flutter/material.dart';
import 'package:plant_app/models/cart.dart';
import 'package:plant_app/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final Cart _cart = Cart();

  Cart get cart => _cart;

  void addItemToCart(CartItem item) {
    _cart.addItem(item);
    notifyListeners();
  }

  void removeItemFromCart(String name) {
    _cart.removeItem(name);
    notifyListeners();
  }

  void clearCart() {
    _cart.clearCart();
    notifyListeners();
  }
}
