import 'package:flutter/material.dart';

class CategoryGridWidget extends StatelessWidget {
  final List<Map<String, dynamic>> categories;

  CategoryGridWidget({super.key, required this.categories});

  final List<Color> circleColors = [
    Color(0xFFFCF4C4),
    Color(0xFFEBE8FB),
    Color(0xFFEFFFE4),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
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

          SizedBox(
            height: 230,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                direction: Axis.vertical,
                spacing: 16,
                runSpacing: 16,
                children: List.generate(categories.length, (index) {
                  final category = categories[index];
                  final color = circleColors[index % circleColors.length];

                  return SizedBox(
                    width: 80,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color,
                          ),
                          child: Center(
                            child: Image.network(
                              category['image'],
                              height: 45,
                              width: 45,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image, size: 30),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          category['name'] ?? '',
                          style: const TextStyle(fontSize: 13),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
