import 'package:check_maintain_frontend/domain/entities/dl_register.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class CollimationErrorChart extends StatelessWidget {
  final List<DlRegister> registers;
  const CollimationErrorChart({super.key, required this.registers});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SfCartesianChart(
        trackballBehavior: TrackballBehavior(
          activationMode: ActivationMode.singleTap,
          builder: (context, trackballDetails) {
            final date = DateFormat('dd/MM/yy').format(trackballDetails.point?.x ?? DateTime.now());
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(date ),
              ));
          },
          markerSettings: TrackballMarkerSettings(
            markerVisibility: TrackballVisibilityMode.visible,
            width: 10,
            height: 10,
            color: colorScheme.onPrimaryContainer,
            borderWidth: 2,
            borderColor: colorScheme.onPrimaryContainer,
          ),
          enable: true),
        
          backgroundColor: colorScheme.background,
          primaryXAxis: DateTimeAxis(
            dateFormat: DateFormat('dd/MM/yy'),
          ),
          primaryYAxis: const NumericAxis(),
          series: [
            LineSeries<ChartData, DateTime>(
              dataSource: _getColumData(registers),
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              dataLabelSettings: const DataLabelSettings(isVisible: true, margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2)),
              color: colorScheme.onPrimaryContainer,
            )
          ]),
    );
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
