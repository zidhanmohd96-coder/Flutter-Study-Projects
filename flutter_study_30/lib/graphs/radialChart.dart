import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialChart extends StatefulWidget {
  List<SalesData> chartData = [
    SalesData(50000, "Salman"),
    SalesData(90000, "Aromal"),
    SalesData(30000, "Sadiq"),
    SalesData(40000, "Shajas"),
  ];

  @override
  State<RadialChart> createState() => _RadialChartState();
}

class _RadialChartState extends State<RadialChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Radial Chart"), elevation: 5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              margin: EdgeInsets.all(10),
              child: SfCircularChart(
                title: ChartTitle(text: "Sales Data"),
                legend: Legend(isVisible: true),
                // backgroundColor: Colors.black,
                palette: [Colors.red, Colors.green, Colors.blue],
                series: [
                  RadialBarSeries<SalesData, String>(
                    radius: '90%',
                    innerRadius: '30%',
                    gap: '3%',
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    trackColor: Colors.grey.shade800,
                    cornerStyle: CornerStyle.bothCurve,
                    dataSource: widget.chartData,
                    xValueMapper: (SalesData data, _) => data.xData,
                    yValueMapper: (SalesData data, _) => data.yData,
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              margin: EdgeInsets.all(10),
              child: SfCircularChart(
                title: ChartTitle(text: "Sales Data"),
                legend: Legend(isVisible: true),
                // backgroundColor: Colors.black,
                palette: [Colors.red, Colors.green, Colors.blue],
                series: [
                  DoughnutSeries<SalesData, String>(
                    // radius: '90%',
                    // innerRadius: '30%',
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    // cornerStyle: CornerStyle.bothCurve,
                    dataSource: widget.chartData,
                    xValueMapper: (SalesData data, _) => data.xData,
                    yValueMapper: (SalesData data, _) => data.yData,
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
  final double yData;
  final String xData;

  SalesData(this.yData, this.xData);
}
