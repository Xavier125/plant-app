import 'package:flutter/material.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/cart/cart_screen.dart';
import 'package:plant_app/screens/home/home_screen.dart';
import 'package:plant_app/screens/plants/catalog_screen.dart';
import 'package:plant_app/screens/plants/plant_detail_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String catalog = '/catalog';
  static const String plantDetail = '/plant_detail';
  static const String cart = '/cart';
  static const String confirm = '/order_complete';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    catalog: (context) => const CatalogScreen(),
    cart: (context) => const CartScreen(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case plantDetail:
        final plant = settings.arguments as Plant;
        return MaterialPageRoute(
          builder: (context) => PlantDetailScreen(plant: plant),
        );
      default:
        return null;
    }
  }
}
