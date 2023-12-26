import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CollimationErrorChart extends StatelessWidget {
  const CollimationErrorChart({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final listSpot = [
      FlSpot(3, 1),
      FlSpot(6, 3),
      FlSpot(8, 10),
      FlSpot(11, 7),
    ];

    return LineChart(
      LineChartData(
        // mark dots as visible

        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
            show: true,
            topTitles: const AxisTitles(),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (listSpot.any((element) => element.x == value)) {
                        return  SideTitleWidget(
                          axisSide: AxisSide.top,
                          child: Text('ok ${value.toString()}'),
                          );
                      }else{
                        return const SideTitleWidget(
                          axisSide: AxisSide.bottom,
                          child: Text(''),
                          );
                      }
                      
                    }
                    )
                    )),
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
    );
  }
}
