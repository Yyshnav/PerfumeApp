import 'package:flutter/material.dart';
import 'package:perfumeapp/widgets/constant_colors.dart/colors.dart';

class BrandListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> brands;

  const BrandListWidget({super.key, required this.brands});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title and View All
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Shop By Brands',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                'View All',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),

        // Horizontal Scroll List
        SizedBox(
          height: 120, // More height
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: brands.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final brand = brands[index];
              return Container(
                width: 130, // More width
                height: 105, // More height
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.brandcard,
                    width: 1,
                  ), // Thin border
                  borderRadius: BorderRadius.circular(12), // Smooth corners
                ),
                child: Center(
                  child: Image.asset(
                    color: Colors.black,
                    brand['image'],
                    fit: BoxFit.contain,
                    height: 37,
                    width: 57,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
