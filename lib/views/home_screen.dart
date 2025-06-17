// // import 'package:flutter/material.dart';
// // import 'package:perfumeapp/viewModels/home_viewModel.dart';
// // import 'package:perfumeapp/widgets/banner_widget.dart';
// // import 'package:perfumeapp/widgets/brandList_widget.dart';
// // import 'package:perfumeapp/widgets/categoryGrid_widget.dart';
// // import 'package:perfumeapp/widgets/constant_colors.dart/colors.dart';
// // import 'package:perfumeapp/widgets/offer_widget.dart';
// // import 'package:perfumeapp/widgets/productList_widget.dart';
// // import 'package:perfumeapp/widgets/sectionTitle_widget.dart';

// // class HomeScreen extends StatelessWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final viewModel = HomeViewModel();
// //     final sections = viewModel.loadHomeSections();

// //     return Scaffold(
// //       backgroundColor: Colors.grey[100],
// //       appBar: AppBar(
// //         automaticallyImplyLeading: false,
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         toolbarHeight: 140,
// //         flexibleSpace: Padding(
// //           padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // Top Row: Welcome text + Notification icon
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: const [
// //                   Text(
// //                     "Welcome, James!",
// //                     style: TextStyle(
// //                       fontFamily: 'Montserrat',
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.bold,
// //                       color: AppColors.textColor,
// //                     ),
// //                   ),
// //                   Image(
// //                     image: AssetImage('assets/icons/Notificatiion.png'),
// //                     height: 24,
// //                     width: 24,
// //                   ),
// //                 ],
// //               ),

// //               const SizedBox(height: 12),

// //               // Search Bar + Scan Button
// //               Row(
// //                 children: [
// //                   // Search Bar
// //                   Expanded(
// //                     child: SizedBox(
// //                       height: 45,
// //                       child: TextField(
// //                         decoration: InputDecoration(
// //                           hintText: "Search...",
// //                           prefixIcon: Image.asset(
// //                             'assets/icons/search.png',
// //                             height: 24,
// //                             width: 24,
// //                           ),
// //                           filled: true,
// //                           fillColor: Colors.white,
// //                           isDense: true,
// //                           contentPadding: EdgeInsets.zero,
// //                           enabledBorder: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(12),
// //                             borderSide: BorderSide(
// //                               color: AppColors.searchbarclr,
// //                             ),
// //                           ),
// //                           focusedBorder: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(12),
// //                             borderSide: BorderSide(color: Colors.red),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),

// //                   const SizedBox(width: 12),

// //                   // Scan Here Button (same height)
// //                   SizedBox(
// //                     height: 45,
// //                     child: Container(
// //                       padding: const EdgeInsets.symmetric(horizontal: 12),
// //                       decoration: BoxDecoration(
// //                         color: AppColors.scanbtnclr,
// //                         borderRadius: BorderRadius.circular(12),
// //                       ),
// //                       child: Row(
// //                         children: [
// //                           Text(
// //                             "Scan Here",
// //                             style: TextStyle(
// //                               fontFamily: 'Hellix',
// //                               color: Colors.white,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                           SizedBox(width: 6),
// //                           Image.asset(
// //                             'assets/icons/barcode 1.png',
// //                             color: Colors.white,
// //                             height: 24,
// //                             width: 24,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),

// //       // Dynamic Body Section based on API type
// //       body: ListView.builder(
// //         itemCount: sections.length,
// //         itemBuilder: (context, index) {
// //           final section = sections[index];

// //           switch (section.type) {
// //             case 'banner':
// //               return BannerWidget(image: section.data['image']);
// //             case 'brands':
// //               return BrandListWidget(brands: section.data);
// //             case 'categories':
// //               return CategoryGridWidget(categories: section.data);
// //             case 'offer':
// //               return OfferWidget(data: section.data);
// //             case 'section_title':
// //               return NewArrivalProductListWidget();
// //             case 'products':
// //               return LatestProductListWidget();
// //             default:
// //               return const SizedBox.shrink();
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:perfumeapp/Models/home_sectionmodel.dart';
// import 'package:perfumeapp/widgets/banner_widget.dart';
// import 'package:perfumeapp/widgets/brandList_widget.dart';
// import 'package:perfumeapp/widgets/categoryGrid_widget.dart';
// import 'package:perfumeapp/widgets/constant_colors.dart/colors.dart';
// import 'package:perfumeapp/widgets/offer_widget.dart';
// import 'package:perfumeapp/widgets/productList_widget.dart';
// import 'package:perfumeapp/widgets/sectionTitle_widget.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoading = true;
//   List<HomeSection> sections = [];

//   @override
//   void initState() {
//     super.initState();
//     autoLoginAndFetchHome();
//   }

//   Future<void> autoLoginAndFetchHome() async {
//     try {
//       final loginResponse = await Dio().post(
//         'https://s419.previewbay.com/fragrance-b2b-backend/api/v1/anonymous-login',
//         data: {"device_token": "test_token", "device_type": 1},
//       );

//       final token = loginResponse.data['data']['access_token'];

//       final homeResponse = await Dio().get(
//         'https://s419.previewbay.com/fragrance-b2b-backend/api/v1/home',
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       print(homeResponse);
//       final List<dynamic> homeFields = homeResponse.data['data']['home_fields'];

//       // Convert response into List<HomeSection>
//       sections = homeFields.map<HomeSection>((item) {
//         final type = item['type'];
//         final dynamic data;

//         switch (type) {
//           case 'carousel':
//             data = item['carousel_items'];
//             break;
//           case 'brands':
//             data = item['brands'];
//             break;
//           case 'category':
//             data = item['categories'];
//             break;
//           case 'collection':
//             data = {
//               'image': item['image']?.toString() ?? '',
//               'title': item['title']?.toString() ?? 'Special Offer',
//               'button': item['button_text']?.toString() ?? 'Shop Now',
//             };
//             break;

//           case 'section_title':
//             data = item['title'] ?? 'Section';
//             break;
//           default:
//             data = item;
//         }

//         return HomeSection(type: type, data: data);
//       }).toList();

//       setState(() {
//         isLoading = false;
//       });
//     } catch (e) {
//       print(" Error loading home sections: $e");
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }

//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         toolbarHeight: 140,
//         flexibleSpace: Padding(
//           padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   Text(
//                     "Welcome, James!",
//                     style: TextStyle(
//                       fontFamily: 'Montserrat',
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.textColor,
//                     ),
//                   ),
//                   Image(
//                     image: AssetImage('assets/icons/Notificatiion.png'),
//                     height: 24,
//                     width: 24,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Row(
//                 children: [
//                   Expanded(
//                     child: SizedBox(
//                       height: 45,
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Search...",
//                           prefixIcon: Image.asset(
//                             'assets/icons/search.png',
//                             height: 24,
//                             width: 24,
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           isDense: true,
//                           contentPadding: EdgeInsets.zero,
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide(
//                               color: AppColors.searchbarclr,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide(color: Colors.red),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   SizedBox(
//                     height: 45,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 12),
//                       decoration: BoxDecoration(
//                         color: AppColors.scanbtnclr,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         children: [
//                           const Text(
//                             "Scan Here",
//                             style: TextStyle(
//                               fontFamily: 'Hellix',
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(width: 6),
//                           Image.asset(
//                             'assets/icons/barcode 1.png',
//                             color: Colors.white,
//                             height: 24,
//                             width: 24,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),

//       body: ListView.builder(
//         itemCount: sections.length,
//         itemBuilder: (context, index) {
//           final section = sections[index];

//           switch (section.type) {
//             case 'carousel':
//               final images = List<Map<String, dynamic>>.from(section.data);
//               // show only first image for now
//               return BannerWidget(image: images.first['image']);
//             case 'brands':
//               return BrandListWidget(
//                 brands: List<Map<String, dynamic>>.from(section.data),
//               );
//             case 'category':
//               return CategoryGridWidget(
//                 categories: List<Map<String, dynamic>>.from(section.data),
//               );
//             case 'collection':
//               if (section.data is Map<String, String>) {
//                 return OfferWidget(data: section.data);
//               } else if (section.data is Map) {
//                 final castedData = Map<String, String>.from(
//                   section.data as Map,
//                 );
//                 return OfferWidget(data: castedData);
//               } else {
//                 return const SizedBox.shrink(); // fallback if data is invalid
//               }

//             // case 'section_title':
//             //   return NewArrivalProductListWidget(title: section.data.toString());
//             // case 'latest_products':
//             //   return LatestProductListWidget(
//             //     products: List<Map<String, dynamic>>.from(section.data),
//             //   );
//             default:
//               return const SizedBox.shrink();
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:perfumeapp/Models/home_sectionmodel.dart';
import 'package:perfumeapp/viewModels/homeprovider.dart';
import 'package:perfumeapp/widgets/banner1widget.dart';
import 'package:perfumeapp/widgets/banner2_widget.dart';
import 'package:perfumeapp/widgets/banner_widget.dart';
import 'package:perfumeapp/widgets/brandList_widget.dart';
import 'package:perfumeapp/widgets/categoryGrid_widget.dart';
import 'package:perfumeapp/widgets/constant_colors.dart/colors.dart';
import 'package:perfumeapp/widgets/future_widget.dart';
import 'package:perfumeapp/widgets/offer_widget.dart';
import 'package:perfumeapp/widgets/productList_widget.dart';
import 'package:perfumeapp/widgets/sectionTitle_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<HomeSection> sections = [];

  final Dio _dio = Dio();
  final String baseUrl =
      'https://s419.previewbay.com/fragrance-b2b-backend/api/v1';

  @override
  void initState() {
    super.initState();
    autoLoginAndFetchHome();
  }

  Future<void> autoLoginAndFetchHome() async {
    try {
      final loginResponse = await _dio.post(
        '$baseUrl/anonymous-login',
        data: {"device_token": "test_token", "device_type": 1},
      );

      final token = loginResponse.data['data']['access_token'];
      print(token);

      final homeResponse = await _dio.get(
        '$baseUrl/home',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      print(homeResponse);
      final List<dynamic> homeFields = homeResponse.data['data']['home_fields'];

      sections = homeFields.map<HomeSection>((item) {
        final type = item['type'];
        dynamic data;

        switch (type) {
          case 'carousel':
            data = item['carousel_items'] ?? [];
            break;
          case 'brands':
            data = item['brands'] ?? [];
            break;
          case 'category':
            data = item['categories'] ?? [];
          case 'banner-grid':
            data = item['banners'] ?? [];
            break;
          case 'collection':
            data = item;
            break;

          case 'section_title':
            data = item['title'] ?? 'Section';
            break;
          case 'banner':
            data = item['banner'] ?? [];
            break;

          case 'latest_products':
            data = item['products'] ?? [];
            break;
          default:
            data = {};
        }

        return HomeSection(type: type, data: data);
      }).toList();

      setState(() => isLoading = false);
    } catch (e) {
      print(" Error : $e");
      setState(() => isLoading = false);
    }
  }

  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    final sections = provider.sections;

    if (provider.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];

          switch (section.type) {
            case 'carousel':
              final images = List<Map<String, dynamic>>.from(section.data);
              final imageUrls = images
                  .map((e) => e['image'].toString())
                  .toList();
              return BannerWidget(images: imageUrls);

            case 'brands':
              return BrandListWidget(
                brands: List<Map<String, dynamic>>.from(section.data),
              );

            case 'category':
              return CategoryGridWidget(
                categories: List<Map<String, dynamic>>.from(section.data),
              );
            case 'rfq':
              final image =
                  section.data['image']; 
              return OfferWidget(image: image);

            case 'collection':
              final collectionData = section.data as Map<String, dynamic>;
              final title = collectionData['name'] ?? 'Collection';
              final rawProducts = collectionData['products'] ?? [];

              final List<Map<String, dynamic>>
              products = rawProducts.map<Map<String, dynamic>>((item) {
                return {
                  "title": item['name'] ?? '',
                  'image': item['image'],
                  "oldPrice":
                      "${item['currency'] ?? ''} ${item['actual_price'] ?? ''}",
                  "newPrice": item['price'] ?? '',
                  "offer": item['offer'] ?? '',
                  "isColored": false,
                };
              }).toList();

              return NewArrivalProductListWidget(
                products: products,
                sectionTitle: title,
              );
            case 'banner':
              final bannerMap = section.data as Map<String, dynamic>;
              final imageUrl = bannerMap['image']?.toString() ?? '';

              return BannerWidget1(images: [imageUrl]);
            case 'future-order':
              final imageUrl = section.data['image'] ?? '';
              return FutureOrderBanner(imageUrl: imageUrl);
            case 'banner-grid':
              final banners = List<Map<String, dynamic>>.from(section.data);
              final imageUrls = banners
                  .map((e) => e['image'].toString())
                  .toList();
              return BannerWidget2(images: imageUrls);
            case 'latest_products':
              return ProductListWidget(
                title: 'Latest Products',
                products: List<Map<String, dynamic>>.from(section.data),
              );

            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 140,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
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

            Row(
              children: [
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
                          borderSide: const BorderSide(
                            color: AppColors.searchbarclr,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.scanbtnclr,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Scan Here",
                        style: TextStyle(
                          fontFamily: 'Hellix',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Image.asset(
                        'assets/icons/barcode 1.png',
                        color: Colors.white,
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
