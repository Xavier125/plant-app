import 'package:flutter/material.dart';
import 'package:plant_app/configs/app_colors.dart';
import 'package:plant_app/configs/app_routes.dart';
import 'package:plant_app/models/cart.dart';
import 'package:plant_app/widgets/plant_card_widget.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({
    super.key,
  });

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        actions: [
          IconButton(
            onPressed: () {
              // AppRoutes.navigateTo(
              //   context,
              //   AppRoutes.cartDetail,
              //   arguments: widget.cart,
              // );
              Navigator.pushNamed(context, AppRoutes.cart);
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryColor, AppColors.accentColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                child: SearchBar(
                  constraints: const BoxConstraints(
                    minHeight: 40,
                    maxHeight: 40,
                  ),
                  hintText: "Search plants...",
                  textStyle: WidgetStateProperty.all(
                    const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  hintStyle: WidgetStateProperty.all(
                    const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  leading: const Icon(Icons.search, color: Colors.grey),
                  trailing: [
                    ValueListenableBuilder<TextEditingValue>(
                      valueListenable: _searchController,
                      builder: (context, value, child) {
                        if (value.text.isNotEmpty) {
                          return IconButton(
                            icon: const Icon(Icons.close, color: Colors.grey),
                            onPressed: () {
                              _searchController.clear();
                              setState(() {});
                            },
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                  controller: _searchController,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shrinkWrap: true,
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return const PlantCard();
                  },
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
