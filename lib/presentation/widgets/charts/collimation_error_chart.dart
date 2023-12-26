import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CollimationErrorChart extends StatefulWidget {
  const CollimationErrorChart({super.key});

  @override
  State<CollimationErrorChart> createState() => _CollimationErrorChartState();
}

class _CollimationErrorChartState extends State<CollimationErrorChart> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final listSpot = [
      FlSpot(DateTime(2023, 12, 24).millisecondsSinceEpoch.toDouble(), 1),
      FlSpot(DateTime(2023, 12, 25).millisecondsSinceEpoch.toDouble(), 3),
      FlSpot(DateTime(2023, 12, 26).millisecondsSinceEpoch.toDouble(), 10),
      FlSpot(DateTime(2023, 12, 27).millisecondsSinceEpoch.toDouble(), 7),
    ];

    return Align(
      alignment: Alignment.topCenter,
      child: AspectRatio(
        aspectRatio: 1.23,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 37,
                ),
                Text(
                  'Collimation Error',
                  style: TextStyle(
                    color: colors.onBackground,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 37,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 16, left: 6, bottom: 20),
                    child: _LineChart(listSpot: listSpot, colors: colors),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.black.withOpacity(1.0),
              ),
              onPressed: () {
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart({
    required this.listSpot,
    required this.colors,
  });

  final List<FlSpot> listSpot;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
              show: true,
              topTitles: const AxisTitles(),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                      reservedSize: 40,
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (listSpot.any((element) {
                          print('value: $value --- element.x: ${element.x}');
                          double tolerance = 1;
                          if ((element.x - value).abs() < tolerance) {
                            return true;
                          } else {
                            return false;
                          }
                        })) {
                          var date = DateTime.fromMillisecondsSinceEpoch(
                              value.toInt());
                          return SideTitleWidget(
                            axisSide: AxisSide.bottom,
                            child:
                                Text('${date.day}/${date.month}/${date.year}'),
                          );
                        } else {
                          return const SideTitleWidget(
                            axisSide: AxisSide.bottom,
                            child: Text(''),
                          );
                        }
                      }))),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              dotData: const FlDotData(show: true),
              spots: listSpot,
              isCurved: false,
              color: colors.onSecondaryContainer,
              barWidth: 3,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(
                  show: true,
                  color: colors.onInverseSurface,
                  gradient: LinearGradient(colors: [
                    colors.secondaryContainer,
                    colors.onInverseSurface
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
