import 'package:flutter/material.dart';
import 'package:perfumeapp/viewModels/home_viewModel.dart';
import 'package:perfumeapp/widgets/banner_widget.dart';
import 'package:perfumeapp/widgets/brandList_widget.dart';
import 'package:perfumeapp/widgets/categoryGrid_widget.dart';
import 'package:perfumeapp/widgets/constant_colors.dart/colors.dart';
import 'package:perfumeapp/widgets/offer_widget.dart';
import 'package:perfumeapp/widgets/productList_widget.dart';
import 'package:perfumeapp/widgets/sectionTitle_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModel();
    final sections = viewModel.loadHomeSections();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 140,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Welcome text + Notification icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Welcome, James!",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/icons/Notificatiion.png'),
                    height: 24,
                    width: 24,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Search Bar + Scan Button
              Row(
                children: [
                  // Search Bar
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          prefixIcon: Image.asset(
                            'assets/icons/search.png',
                            height: 24,
                            width: 24,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: AppColors.searchbarclr,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Scan Here Button (same height)
                  SizedBox(
                    height: 45,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: AppColors.scanbtnclr,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Scan Here",
                            style: TextStyle(
                              fontFamily: 'Hellix',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 6),
                          Image.asset(
                            'assets/icons/barcode 1.png',
                            color: Colors.white,
                            height: 24,
                            width: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // Dynamic Body Section based on API type
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];

          switch (section.type) {
            case 'banner':
              return BannerWidget(image: section.data['image']);
            case 'brands':
              return BrandListWidget(brands: section.data);
            case 'categories':
              return CategoryGridWidget(categories: section.data);
            case 'offer':
              return OfferWidget(data: section.data);
            case 'section_title':
              return NewArrivalProductListWidget();
            case 'products':
              return ProductListWidget(products: section.data);
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
