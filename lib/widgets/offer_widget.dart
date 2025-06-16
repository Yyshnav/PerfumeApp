import 'package:flutter/material.dart';

class OfferWidget extends StatelessWidget {
  final Map<String, String> data;
  const OfferWidget({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Stack(
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              data['image']!,
              width: 345,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),

          // Title Text
          Positioned(
            left: 15,
            top: 30,
            child: Text(
              data['title'] ?? 'Request for Quote',
              style: const TextStyle(
                fontFamily: 'Hellix',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                height: 1.0,
                letterSpacing: 0,
                color: Colors.white,
              ),
            ),
          ),

          // Custom Button
          Positioned(
            left: 18,
            top: 72,
            child: SizedBox(
              width: 110,
              height: 34,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(44),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  data['button'] ?? 'Create RFQ',
                  style: const TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
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
