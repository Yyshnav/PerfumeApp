import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../Models/home_sectionmodel.dart';

class HomeProvider with ChangeNotifier {
  bool isLoading = true;
  List<HomeSection> sections = [];

  final Dio _dio = Dio();
  final String baseUrl =
      'https://s419.previewbay.com/fragrance-b2b-backend/api/v1';

  HomeProvider() {
    fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    try {
      final loginResponse = await _dio.post(
        '$baseUrl/anonymous-login',
        data: {"device_token": "test_token", "device_type": 1},
      );

      final token = loginResponse.data['data']['access_token'];

      final homeResponse = await _dio.get(
        '$baseUrl/home',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

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
            break;
          case 'rfq':
            data = {'image': item['image'] ?? ''};
            break;
          case 'banner':
            data = item['banner'] ?? {};
          case 'future-order':
            data = item;
            break;
          case 'banner-grid':
            data = item['banners'] ?? [];
            break;
          case 'collection':
            data = item;
            break;
          case 'section_title':
            data = item['title'] ?? 'Section';
            break;
          case 'latest_products':
            data = item['products'] ?? [];
            break;
          default:
            data = {};
        }

        return HomeSection(type: type, data: data);
      }).toList();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(" Error: $e");
      isLoading = false;
      notifyListeners();
    }
  }
}
