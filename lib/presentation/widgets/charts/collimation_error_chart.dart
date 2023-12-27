import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class CollimationErrorChart extends StatefulWidget {
  const CollimationErrorChart({super.key});

  @override
  State<CollimationErrorChart> createState() => _CollimationErrorChartState();
}

class _CollimationErrorChartState extends State<CollimationErrorChart> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SfCartesianChart(
      backgroundColor: colorScheme.background,
        primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat('dd/MM'),
        ),
        primaryYAxis: const NumericAxis(),
        series: [
          LineSeries<ChartData, DateTime>(
            dataSource: getColumData(),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            color: colorScheme.onPrimaryContainer,
          )
        ]);
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double y;
}

dynamic getColumData() {
  List<ChartData> columData = [
    ChartData(
        DateTime(
          2023,
          12,
          24,
        ),
        0.3),
    ChartData(
        DateTime(
          2023,
          12,
          25,
        ),
        0.5),
    ChartData(
        DateTime(
          2023,
          12,
          26,
        ),
        0.1),
    ChartData(
        DateTime(
          2023,
          12,
          27,
        ),
        0.7),
  ];
  return columData;
}
