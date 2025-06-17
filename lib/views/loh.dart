// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   String? token;
//   dynamic homeData;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     autoLoginAndFetchHome();
//   }

//   Future<void> autoLoginAndFetchHome() async {
//     try {
//       // Step 1: Anonymous login
//       final loginResponse = await Dio().post(
//         'https://s419.previewbay.com/fragrance-b2b-backend/api/v1/anonymous-login',
//         data: {"device_token": "test_token", "device_type": 1},
//       );

//       token = loginResponse.data['data']['access_token'];
//       print("✅ Got Token: $token");

//       // Step 2: Use token to fetch home data
//       final homeResponse = await Dio().get(
//         'https://s419.previewbay.com/fragrance-b2b-backend/api/v1/home',
//         options: Options(headers: {'Authorization': 'Bearer $token'}),
//       );
//       print(homeResponse);

//       setState(() {
//         homeData = homeResponse.data;
//         isLoading = false;
//       });
//     } catch (e) {
//       print("❌ Error: $e");
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
//       appBar: AppBar(title: const Text('Home')),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           Text("Home data loaded successfully ✅"),
//           Text(homeData.toString()), // you can parse and show actual UI
//         ],
//       ),
//     );
//   }
// }
