// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import '../models/home_section.dart'; // Make sure this file exists
// import 'package:shared_preferences/shared_preferences.dart';

// class HomeViewModel extends ChangeNotifier {
//   final Dio _dio = Dio();
//   final String baseUrl = 'https://app.headboxu.com/public/api';

//   bool isLoading = true;
//   List<HomeSection> sections = [];

//   Future<void> loadHome() async {
//     try {
//       isLoading = true;
//       notifyListeners();

//       // Try existing token first
//       final prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('access_token');

//       if (token == null) {
//         token = await _loginAnonymously();
//         await prefs.setString('access_token', token);
//       }

//       final homeRes = await _dio.get(
//         '$baseUrl/home',
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );

//       final fields = homeRes.data['data']['home_fields'] as List;
//       sections = fields.map((field) {
//         return HomeSection(
//           type: field['type'],
//           data: field['data'],
//         );
//       }).toList();
//     } catch (e) {
//       print('Error loading home: $e');
//       sections = [];
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<String> _loginAnonymously() async {
//     final loginRes = await _dio.post('$baseUrl/login-anonymous');
//     return loginRes.data['data']['access_token'];
//   }
// }
