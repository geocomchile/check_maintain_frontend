import 'package:check_maintain_frontend/domain/entities/dl_register.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class CollimationErrorChart extends StatefulWidget {
  final List<DlRegister> registers;
  const CollimationErrorChart({super.key, required this.registers});

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
          dateFormat: DateFormat('dd/MM/yy'),
        ),
        primaryYAxis: const NumericAxis(),
        series: [
          LineSeries<ChartData, DateTime>(
            dataSource: _getColumData(widget.registers),
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

List<ChartData> _getColumData(List<DlRegister> registers) {
  final List<ChartData> columData = [];
  for (final register in registers) {
    columData.add(ChartData(register.dateError, register.collimationError));
  }
  return columData;
}
