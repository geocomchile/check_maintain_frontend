import 'package:check_maintain_frontend/presentation/widgets/charts/collimation_error_chart.dart';
import 'package:flutter/material.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});
  static const name = 'ExampleScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: const Center(
        child: CollimationErrorChart(),
      ),
    );
  }
}