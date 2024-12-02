import 'package:flutter/material.dart';
import 'package:plant_app/configs/app_colors.dart';
import 'package:plant_app/configs/app_routes.dart';
import 'package:plant_app/models/plant.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;
  const PlantCard({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1,
            offset: Offset(2.0, 1.0),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 1,
                  offset: Offset(1.0, 2.0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(
                'assets/images/plants/plant_(${plant.id}).png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          Expanded(child: Text(plant.name)),
          const SizedBox(
            width: 4.0,
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRoutes.plantDetail,
                arguments: plant),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 8.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: AppColors.primaryColor,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.primaryColor,
                    blurRadius: 3,
                    spreadRadius: 1,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
              child: const Text(
                'View More',
                style: TextStyle(
                  color: AppColors.accentColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
