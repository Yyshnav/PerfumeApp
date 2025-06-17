import 'package:flutter/material.dart';
import 'package:perfumeapp/widgets/constant_colors.dart/colors.dart';

class NewArrivalProductListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final String sectionTitle;

  const NewArrivalProductListWidget({
    super.key,
    required this.products,
    required this.sectionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionTitle,
                style: const TextStyle(
                  fontFamily: 'Hellix',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "View All",
                style: TextStyle(
                  fontFamily: 'Hellix',
                  fontSize: 14,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        if (products.isNotEmpty)
          SizedBox(
            height: 291,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _buildProductCard(products[index]);
              },
            ),
          ),

        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      width: 165,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              const Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.favorite_border, size: 20),
              ),
              const SizedBox(height: 4),

              Center(
                child: (product['isColored'] == true)
                    ? ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.purpleAccent,
                          BlendMode.modulate,
                        ),
                        child: Image.network(
                          product['image'] ?? '',
                          height: 109.43,
                          width: 90,
                          errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                        ),
                      )
                    : Image.network(
                        product['image'] ?? '',
                        height: 109.43,
                        width: 90,
                        errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                      ),
              ),

              const SizedBox(height: 8),

              Text(
                product['title'] ?? '',
                style: const TextStyle(
                  fontFamily: 'Hellix',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                product['oldPrice'] ?? '',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "AED ",
                  style: const TextStyle(fontSize: 12),
                  children: [
                    TextSpan(
                      text: product['newPrice'] ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const TextSpan(
                      text: "  per Dozen",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  IntrinsicWidth(
                    child: Container(
                      height: 34,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(44),
                      ),
                      child: const Text(
                        "RFQ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 34,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.scanbtnclr,
                        borderRadius: BorderRadius.circular(44),
                      ),
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if ((product['offer'] ?? '').toString().isNotEmpty)
            Positioned(
              top: 10,
              left: -10,
              child: IntrinsicWidth(
                child: Container(
                  height: 20,
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                  decoration: const BoxDecoration(
                    color: AppColors.oferbg,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    product['offer'],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF28B463),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
