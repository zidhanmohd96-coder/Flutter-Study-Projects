import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math' as math;

class LiveChart extends StatefulWidget {
  @override
  State<LiveChart> createState() => _LiveChartState();
}

class _LiveChartState extends State<LiveChart> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;

  @override
  void initState() {
    super.initState();
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(time: 0, speed: 42),
      LiveData(time: 1, speed: 49),
      LiveData(time: 2, speed: 92),
      LiveData(time: 3, speed: 82),
      LiveData(time: 4, speed: 72),
      LiveData(time: 5, speed: 62),
      LiveData(time: 6, speed: 52),
      LiveData(time: 7, speed: 12),
      LiveData(time: 8, speed: 22),
      LiveData(time: 9, speed: 32),
    ];
  }

  int time = 10;

  updateDataSource(Timer timer) {
    chartData.add(LiveData(time: time++, speed: math.Random().nextInt(60)));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
      addedDataIndex: chartData.length - 1,
      removedDataIndex: 0,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Live Chart"), elevation: 5),
      body: SingleChildScrollView(
        child: SfCartesianChart(
          legend: Legend(isVisible: true),
          series: [
            LineSeries<LiveData, int>(
              legendItemText: 'Speed',

              onRendererCreated: (ChartSeriesController controller) {
                _chartSeriesController = controller;
              },
              dataSource: chartData,
              xValueMapper: (LiveData data, _) => data.time,
              yValueMapper: (LiveData data, _) => data.speed,
            ),
          ],
          primaryXAxis: NumericAxis(
            majorGridLines: MajorGridLines(width: 1),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            interval: 2,
            title: AxisTitle(text: "Time(seconds)"),
          ),
          primaryYAxis: NumericAxis(
            majorGridLines: MajorGridLines(width: 1),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            interval: 2,
            title: AxisTitle(text: "Speed(m/s)"),
          ),
        ),
      ),
    );
  }
}

class LiveData {
  final int time;
  final num speed;

  LiveData({required this.time, required this.speed});
}
