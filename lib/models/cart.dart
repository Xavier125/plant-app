import 'package:plant_app/models/cart_item.dart';

class Cart {
  List<CartItem> items = [];

  void addItem(CartItem item) {
    int index = items.indexWhere((i) => i.id == item.id);

    if (index != -1) {
      items[index].quantity += item.quantity;
    } else {
      items.add(item);
    }
  }

  void removeItem(int id) {
    items.removeWhere((item) => item.id == id);
  }

  void updateItemQuantity(int id, int quantity) {
    int index = items.indexWhere((item) => item.id == id);

    if (index != -1) {
      items[index].quantity += quantity;
    }
  }

  double getItemTotalPrice(int id) {
    double price = 0;
    int index = items.indexWhere((i) => i.id == id);

    if (index != -1) {
      price += items[index].price * items[index].quantity;
    }

    return price;
  }

  double getCartTotalPrice() {
    double totalPrice = 0;
    for (var item in items) {
      totalPrice += item.price * item.quantity;
    }
    return totalPrice;
  }

  void clearCart() {
    items.clear();
  }
}
