import 'package:flutter/material.dart';
import 'package:plant_app/app.dart';
import 'package:plant_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const App(),
    ),
  );
}
