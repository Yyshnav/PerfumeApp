// import 'package:flutter/material.dart';

// class HomeAppBarWidget extends StatelessWidget {
//   const HomeAppBarWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Padding(
//       padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Welcome text
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Welcome, ",
//                 style: TextStyle(fontSize: 16),
//               ),
//               const Icon(Icons.notifications_none),
//             ],
//           ),
//           const Text(
//             "James!",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),

//           const SizedBox(height: 16),

//           // Search bar and Scan button
//           Row(
//             children: [
//               // Search Bar
//               Expanded(
//                 child: Container(
//                   height: 45,
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Row(
//                     children: [
//                       Icon(Icons.search, color: Colors.grey),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: "Search...",
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               const SizedBox(width: 12),

//               // Scan Button
//               Container(
//                 height: 45,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Row(
//                   children: [
//                     Text(
//                       "Scan Here",
//                       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(width: 6),
//                     Icon(Icons.qr_code_scanner, color: Colors.white),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
