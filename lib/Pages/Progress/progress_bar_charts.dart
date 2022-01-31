// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class ProgressBarCharts extends StatefulWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;
//
//   ProgressBarCharts(this.seriesList, {this.animate});
//
//   factory ProgressBarCharts.withSampleData() {
//     return ProgressBarCharts(
//       _createSampleData(),
//       animate: true,
//     );
//   }
//
//   @override
//   State<ProgressBarCharts> createState() => _ProgressBarChartsState();
//
//   static List<charts.Series<OrdinalProgress, String>> _createSampleData() {
//     final user = FirebaseAuth.instance.currentUser;
//
//     var a = 10;
//     // want to make a variable here, which store int value from firebase Firestore(UserData --> document--> absCal).
//     // and want to use tht variable in data[] as int to make dynamic bar chart.
//     final data = [
//       OrdinalProgress('abs', a),
//       OrdinalProgress('shoulder', 25),
//       OrdinalProgress('chest', 10),
//       OrdinalProgress('back', 50),
//     ];
//
//     return [
//       charts.Series<OrdinalProgress, String>(
//         id: 'Progress',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (OrdinalProgress progress, _) => progress.year,
//         measureFn: (OrdinalProgress sales, _) => sales.sales,
//         data: data,
//       )
//     ];
//   }
// }
//
// class _ProgressBarChartsState extends State<ProgressBarCharts> {
//   @override
//   Widget build(BuildContext context) {
//     return charts.BarChart(
//       widget.seriesList,
//       animate: widget.animate,
//     );
//   }
// }
//
// class OrdinalProgress {
//   final String year;
//   final dynamic sales;
//
//   OrdinalProgress(this.year, this.sales);
// }
