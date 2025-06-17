import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerWidget1 extends StatelessWidget {
  final List<String> images;

  const BannerWidget1({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 160,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            autoPlayInterval: const Duration(seconds: 3),
          ),
          items: images.map<Widget>((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (_, __, ___) =>
                      const Center(child: Icon(Icons.broken_image)),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
