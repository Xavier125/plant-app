import 'package:flutter/material.dart';
import 'package:plant_app/configs/app_colors.dart';
import 'package:plant_app/configs/app_routes.dart';
import 'package:plant_app/data/plant_data.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/widgets/plant_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> bannerImages = [
      'assets/images/banners/banner-1.png',
      'assets/images/banners/banner-2.png',
      'assets/images/banners/banner-3.png',
    ];

    List<Plant> plants = plantData();

    return Scaffold(
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
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          direction: Axis.vertical,
                          children: [
                            Text(
                              'Hi,',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            Text(
                              'Xavier',
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          maxRadius: 55,
                          backgroundImage:
                              AssetImage('assets/images/character.jpeg'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    height: 250,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 1,
                          offset: Offset(0, 3.0),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bannerImages.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 150.0,
                          width: MediaQuery.sizeOf(context).width,
                          child: ClipRRect(
                            child: Image.asset(
                              bannerImages[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 1,
                                  offset: Offset(2.0, 4.0),
                                ),
                              ],
                            ),
                            child: const Wrap(
                              direction: Axis.vertical,
                              children: [
                                Text(
                                  'Wallet Balance',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    height: 2,
                                  ),
                                ),
                                Text(
                                  'MYR 6.00',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 1,
                                  offset: Offset(2.0, 4.0),
                                ),
                              ],
                            ),
                            child: const Wrap(
                              direction: Axis.vertical,
                              children: [
                                Text(
                                  'Points',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    height: 2,
                                  ),
                                ),
                                Text(
                                  '789',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 1,
                                  offset: Offset(2.0, 4.0),
                                ),
                              ],
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Order Now',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  // Search
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                                icon:
                                    const Icon(Icons.close, color: Colors.grey),
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
                  // Top Selling
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 32.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Featured Plants',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.catalog);
                              },
                              child: const Text(
                                'More',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          padding: const EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            final plant = plants[index];
                            return PlantCard(
                              plant: plant,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
