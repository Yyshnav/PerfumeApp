import 'package:flutter/material.dart';

class CategoryGridWidget extends StatelessWidget {
  final List<Map<String, dynamic>> categories;

  const CategoryGridWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Our Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "View All",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Grid
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: categories.map((category) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: category['bgColor'],
                    ),
                    child: Center(
                      child: Image.asset(
                        category['image'],
                        height: 49,
                        width: 45,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(category['name'], style: const TextStyle(fontSize: 13)),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
