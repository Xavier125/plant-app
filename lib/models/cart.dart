import 'package:plant_app/models/cart_item.dart';

class Cart {
  List<CartItem> items = [];

  void addItem(CartItem item) {
    int index = items.indexWhere((i) => i.name == item.name);

    if (index != -1) {
      items[index].quantity += item.quantity;
    } else {
      items.add(item);
    }
  }

  void removeItem(String name) {
    items.removeWhere((item) => item.name == name);
  }

  void updateItemQuantity(String name, int quantity) {
    int index = items.indexWhere((item) => item.name == name);

    if (index != -1) {
      items[index].quantity += quantity;
    }
  }

  double getItemTotalPrice(String name) {
    double price = 0;
    int index = items.indexWhere((i) => i.name == name);

    if (index != -1) {
      price += items[index].price * items[index].quantity;
    }

    return price;
  }

  void clearCart() {
    items.clear();
  }
}
