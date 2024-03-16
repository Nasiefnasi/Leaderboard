// // import 'package:fl_chart/fl_chart.dart';
// // import 'package:flutter/material.dart';

// // class Claa extends StatelessWidget {
// //   const Claa({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Container(
// //           color: Colors.amber,
// //           width: double.infinity,
// //           height: double.infinity,child: BarChart(swapAnimationCurve: Curves.bounceIn,BarChartData()),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class BarChartPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bar Chart'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: SizedBox(
//             width: double.infinity,
//             height: 300,
//             child: BarChart(
//               BarChartData(
//                 alignment: BarChartAlignment.spaceAround,
//                 maxY: 20,
//                 barTouchData: BarTouchData(enabled: false),
//                 titlesData: FlTitlesData(
//                   // leftTitles: SideTitles(showTitles: true,te),
//                   bottomTitles: SideTitles(
//                     showTitles: true,
//                     textStyle: TextStyle(color: Colors.black),
//                     margin: 10,
//                     getTitles: (value) {
//                       switch (value.toInt()) {
//                         case 0:
//                           return 'Jan';
//                         case 1:
//                           return 'Feb';
//                         case 2:
//                           return 'Mar';
//                         default:
//                           return '';
//                       }
//                     },
//                   ),
//                 ),
//                 borderData: FlBorderData(
//                   show: true,
//                   border: Border.all(width: 1),
//                 ),
//                 barGroups: [
//                   BarChartGroupData(
//                     x: 0,
//                     barRods: [
//                       BarChartRodData(y: 10, color: Colors.blue),
//                     ],
//                   ),
//                   BarChartGroupData(
//                     x: 1,
//                     barRods: [
//                       BarChartRodData(y: 15, color: Colors.green),
//                     ],
//                   ),
//                   BarChartGroupData(
//                     x: 2,
//                     barRods: [
//                       BarChartRodData(y: 12, color: Colors.orange),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
 