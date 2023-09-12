import 'package:example/src/features/chart/presentation/widgets/steps_future.dart';
import 'package:flutter/material.dart';

class StepsChartPage extends StatelessWidget {
  const StepsChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Steps Chart Page'),
      ),
      body: const StepsFuture(),
    );
  }
}
