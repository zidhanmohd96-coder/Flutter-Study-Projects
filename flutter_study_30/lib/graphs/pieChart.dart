import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatefulWidget {
  List<SalesData> chartData = [
    SalesData(50000, "Salman"),
    SalesData(90000, "Aromal"),
    SalesData(30000, "Sadiq"),
  ];

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pie Chart"), elevation: 5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              margin: EdgeInsets.all(10),
              child: SfCircularChart(
                title: ChartTitle(text: "Sales Data"),
                legend: Legend(isVisible: true),
                // backgroundColor: Colors.black,
                palette: [Colors.red, Colors.green, Colors.blue],
                series: [
                  PieSeries<SalesData, String>(
                    // radius: '200',
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    explode: true,
                    explodeIndex: 2,
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
