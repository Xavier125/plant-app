import 'package:flutter/material.dart';
import 'package:plant_app/configs/app_colors.dart';
import 'package:plant_app/configs/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant App',
      theme: ThemeData(
        fontFamily: 'Fredoka',
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(
            AppColors.primaryColor.value,
            <int, Color>{
              50: AppColors.primaryColor.withOpacity(0.1),
              100: AppColors.primaryColor.withOpacity(0.2),
              200: AppColors.primaryColor.withOpacity(0.3),
              300: AppColors.primaryColor.withOpacity(0.4),
              400: AppColors.primaryColor.withOpacity(0.5),
              500: AppColors.primaryColor,
              600: AppColors.primaryColor.withOpacity(0.7),
              700: AppColors.primaryColor.withOpacity(0.8),
              800: AppColors.primaryColor.withOpacity(0.9),
              900: AppColors.primaryColor,
            },
          ),
        ).copyWith(
          secondary: AppColors.accentColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.accentColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: true,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
