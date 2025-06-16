// banner_widget.dart
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String image;
  const BannerWidget({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(image, fit: BoxFit.cover, height: 160, width: double.infinity),
      ),
    );
  }
}