import 'package:example/src/features/chart/presentation/providers/steps_provider.dart';
import 'package:example/src/features/chart/presentation/widgets/steps_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StepsFuture extends StatelessWidget {
  const StepsFuture({super.key});

  @override
  Widget build(BuildContext context) {
    Future getStepsList() async {
      return context.read<StepsProvider>().getStepsList();
    }

    return FutureBuilder(
      future: getStepsList(),
      builder: (context, _) {
        final data = Provider.of<StepsProvider>(context);
        if (data.stepsState == StepsState.loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (data.stepsState == StepsState.loaded) {
          if (data.stepsList != null &&
              data.stepsList!.stepsByDay!.isNotEmpty) {
            return StepsChart(stepsList: data.stepsList!);
          } else {
            return const Center(
              child: Text('No Data'),
            );
          }
        } else if (data.stepsState == StepsState.error) {
          return Text(data.errorMessage!);
        } else {
          return const Center(
            child: Text('No Internet'),
          );
        }
      },
    );
  }
}
