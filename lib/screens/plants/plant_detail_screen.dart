import 'package:flutter/material.dart';
import 'package:plant_app/configs/app_colors.dart';
import 'package:plant_app/models/cart.dart';
import 'package:plant_app/models/cart_item.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class PlantDetailScreen extends StatefulWidget {
  final Plant plant;
  const PlantDetailScreen({super.key, required this.plant});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.plant.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 360,
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.asset(
                    'assets/images/plants/plant_(${widget.plant.id}).png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                widget.plant.name,
                style: const TextStyle(
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
                      for (var i = 0; i < 5; i++)
                        Icon(
                          i < widget.plant.rating
                              ? Icons.star_outlined
                              : Icons.star_outline,
                          color: i < widget.plant.rating
                              ? Colors.yellow[700]
                              : Colors.grey,
                        ),
                      Text(
                        '(${widget.plant.rating})',
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    'RM ${widget.plant.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    widget.plant.description,
                    style: const TextStyle(
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
