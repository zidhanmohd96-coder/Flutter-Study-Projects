import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CartesianChart extends StatefulWidget {
  final List<SalesData> chartData = [
    SalesData(year: 2020, sales: 100000, color: Colors.red),
    SalesData(year: 2021, sales: 200000, color: Colors.green),
    SalesData(year: 2022, sales: 10000, color: Colors.yellow),
    SalesData(year: 2023, sales: 40000, color: Colors.purple),
    SalesData(year: 2024, sales: 150000, color: Colors.brown),
    SalesData(year: 2025, sales: 50000, color: Colors.brown),
  ];
  CartesianChart({super.key});

  @override
  State<CartesianChart> createState() => _CartesianChartState();
}

class _CartesianChartState extends State<CartesianChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cartesian Chart"), elevation: 5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              margin: EdgeInsets.all(10),
              child: SfCartesianChart(
                legend: Legend(isVisible: true),
                title: ChartTitle(text: "Sales"),
                series: <CartesianSeries>[
                  LineSeries<SalesData, int>(
                    dashArray: [10, 5],
                    legendItemText: "Sales",
                    dataSource: widget.chartData,
                    pointColorMapper: (SalesData sales, _) => sales.color,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              margin: EdgeInsets.all(10),
              child: SfCartesianChart(
                legend: Legend(isVisible: true),
                title: ChartTitle(text: "Sales"),
                series: <CartesianSeries>[
                  AreaSeries<SalesData, int>(
                    dashArray: [10, 5],
                    legendItemText: "Sales",
                    dataSource: widget.chartData,
                    pointColorMapper: (SalesData sales, _) => sales.color,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              margin: EdgeInsets.all(10),
              child: SfCartesianChart(
                legend: Legend(isVisible: true),
                title: ChartTitle(text: "Sales"),
                series: <CartesianSeries>[
                  WaterfallSeries<SalesData, int>(
                    dashArray: [10, 5],
                    legendItemText: "Sales",
                    dataSource: widget.chartData,
                    pointColorMapper: (SalesData sales, _) => sales.color,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              margin: EdgeInsets.all(10),
              child: SfCartesianChart(
                legend: Legend(isVisible: true),
                title: ChartTitle(text: "Sales"),
                series: <CartesianSeries>[
                  ColumnSeries<SalesData, int>(
                    dashArray: [10, 5],
                    legendItemText: "Sales",
                    dataSource: widget.chartData,
                    pointColorMapper: (SalesData sales, _) => sales.color,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              margin: EdgeInsets.all(10),
              child: SfCartesianChart(
                legend: Legend(isVisible: true),
                title: ChartTitle(text: "Sales"),
                series: <CartesianSeries>[
                  BarSeries<SalesData, int>(
                    dashArray: [10, 5],
                    legendItemText: "Sales",
                    dataSource: widget.chartData,
                    pointColorMapper: (SalesData sales, _) => sales.color,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                  ),
                ],
              ),
            ),
            Container(
              height: 600,
              margin: EdgeInsets.all(10),
              child: SfCartesianChart(
                legend: Legend(isVisible: true),
                title: ChartTitle(text: "Sales"),
                series: <CartesianSeries>[
                  SplineSeries<SalesData, int>(
                    dashArray: [10, 5],
                    legendItemText: "Sales",
                    dataSource: widget.chartData,
                    pointColorMapper: (SalesData sales, _) => sales.color,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  final int year;
  final double sales;
  final Color color;

  SalesData({required this.year, required this.sales, required this.color});
}
