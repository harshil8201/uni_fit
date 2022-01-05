/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SimpleBarChart extends StatefulWidget {

  final List<charts.Series> seriesList;
  final bool animate;


  SimpleBarChart(this.seriesList, {this.animate});

  factory SimpleBarChart.withSampleData() {
    return SimpleBarChart(
      _createSampleData(),
      animate: true,
    );
  }


  @override
  State<SimpleBarChart> createState() => _SimpleBarChartState();
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {

    // int b = FirebaseFirestore.instance.collection('UserData').doc('email').get({})

    final data = [
      OrdinalSales('abs', 10),
      OrdinalSales('shoulder', 25),
      OrdinalSales('chest', 10),
      OrdinalSales('back', 75),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class _SimpleBarChartState extends State<SimpleBarChart> {
  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      widget.seriesList,
      animate: widget.animate,
    );
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}