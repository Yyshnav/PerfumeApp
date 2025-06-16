import 'dart:ui';

import 'package:perfumeapp/Models/home_sectionmodel.dart';

class HomeViewModel {
  List<HomeSection> loadHomeSections() {
    return [
      HomeSection(
        type: "banner",
        data: {"image": "assets/images/Rectangle 91.png"},
      ),

      HomeSection(
        type: "brands",
        data: [
          {"name": "HERMES", "image": "assets/images/brand1.png"},
          {"name": "CHANEL", "image": "assets/images/brand2.png"},
          {"name": "JO", "image": "assets/images/brand3.png"},
        ],
      ),

      HomeSection(
        type: "categories",
        data: [
          {
            "name": "Citrus",
            "image": "assets/images/perfume.png",
            "bgColor": Color(0xFFFCF4C4),
          },
          {
            "name": "Aromatic",
            "image": "assets/images/perfume.png",
            "bgColor": Color(0xFFEBE8FB),
          },
          {
            "name": "Floral",
            "image": "assets/images/perfume.png",
            "bgColor": Color(0xFFFFDCDB),
          },
          {
            "name": "Green",
            "image": "assets/images/perfume.png",
            "bgColor": Color(0xFFEFFFE4),
          },
          {
            "name": "Green",
            "image": "assets/images/perfume.png",
            "bgColor": Color(0xFFEFFFE4),
          },
          {
            "name": "Floral",
            "image": "assets/images/perfume.png",
            "bgColor": Color(0xFFFFDCDB),
          },
          {
            "name": "Citrus",
            "image": "assets/images/perfume.png",
            "bgColor": Color(0xFFFCF4C4),
          },
          {
            "name": "Aromatic",
            "image": "assets/images/perfume.png",
            "bgColor": Color(0xFFEBE8FB),
          },
        ],
      ),

      HomeSection(
        type: "offer",
        data: {
          "text": "Request Your Quote",
          "button": "Create RFQ ",
          "image": "assets/images/carousel.png",
        },
      ),

      HomeSection(type: "section_title", data: "New Arrivals"),

      HomeSection(
        type: "products",
        data: [
          {
            "name": "La Vie Est Belle",
            "price": "₹4,950",
            "image": "https://...",
          },
          {
            "name": "Green Irish Tweed",
            "price": "₹6,190",
            "image": "https://...",
          },
        ],
      ),

      HomeSection(type: "section_title", data: "Latest Products"),

      HomeSection(
        type: "products",
        data: [
          {"name": "Rose Essence", "price": "₹2,899", "image": "https://..."},
          {"name": "Cool Water", "price": "₹3,199", "image": "https://..."},
        ],
      ),
    ];
  }
}
