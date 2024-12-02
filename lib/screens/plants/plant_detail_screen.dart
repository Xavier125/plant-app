import 'package:flutter/material.dart';
import 'package:plant_app/configs/app_colors.dart';
import 'package:plant_app/models/cart.dart';
import 'package:plant_app/models/cart_item.dart';
import 'package:plant_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class PlantDetailScreen extends StatefulWidget {
  const PlantDetailScreen({super.key});

  @override
  State<PlantDetailScreen> createState() => _PlantDetailScreenState();
}

class _PlantDetailScreenState extends State<PlantDetailScreen> {
  int quantity = 1;
  Cart cart = Cart();

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  // void _addToCart(String name, double price, int quantity) {
  //   CartItem cartItem = CartItem(name: name, price: price, quantity: quantity);
  //   setState(() {
  //     cart.addItem(cartItem);
  //   });
  //   print(cart);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Name'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 360,
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.network(
                  'https://www.shutterstock.com/image-photo/young-plant-growth-spouts-on-260nw-2510787589.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: const Text(
                'Plant Name',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_outlined,
                        color: Colors.yellow[700],
                      ),
                      Icon(
                        Icons.star_outlined,
                        color: Colors.yellow[700],
                      ),
                      Icon(
                        Icons.star_outlined,
                        color: Colors.yellow[700],
                      ),
                      const Icon(
                        Icons.star_outline,
                        color: Colors.grey,
                      ),
                      const Icon(
                        Icons.star_outline,
                        color: Colors.grey,
                      ),
                      const Text(
                        '(3.0)',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  const Text(
                    'RM 25.00',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  const Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.remove,
                    size: 26.0,
                  ),
                  onPressed: _decreaseQuantity,
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add,
                    size: 26.0,
                  ),
                  onPressed: _increaseQuantity,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('Item added: $quantity');
                setState(() {
                  Provider.of<CartProvider>(context, listen: false)
                      .addItemToCart(
                    CartItem(
                      name: 'Product Item',
                      price: 10.50,
                      quantity: quantity,
                    ),
                  );
                  quantity = 1;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              child: const Text(
                'Add To Cart',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.accentColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
