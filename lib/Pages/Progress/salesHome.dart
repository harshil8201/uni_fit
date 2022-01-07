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
    final user = FirebaseAuth.instance.currentUser;

    var a = 10;
    // want to make a variable here, which store int value from firebase Firestore(UserData --> document--> absCal).
    // and want to use tht variable in data[] as int to make dynamic bar chart.
    final data = [
      OrdinalSales('abs', a),
      OrdinalSales('shoulder', 25),
      OrdinalSales('chest', 10),
      OrdinalSales('back', 50),
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
  final dynamic sales;

  OrdinalSales(this.year, this.sales);
}
