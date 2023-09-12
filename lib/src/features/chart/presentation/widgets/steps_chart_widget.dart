import 'package:d_chart/commons/axis.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/commons/enums.dart';
import 'package:d_chart/commons/style.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:flutter/material.dart';

import '../../data/models/steps_list_model.dart';

class StepsChart extends StatelessWidget {
  const StepsChart({
    super.key,
    required this.stepsList,
  });

  final StepsList stepsList;
  // StepsRepoInterface stepsRepo = StepsRepoInterface();
  //
  // Future<StepsList?> getStepsList() async {
  //   stepsList = await stepsRepo.getLocalStepsList();
  //   return stepsList;
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(
  //     Duration.zero,
  //     () async {
  //       await getStepsList();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return
        // (stepsList != null)
        AspectRatio(
      aspectRatio: 16 / 10,
      child: DChartBarO(
        measureAxis: const MeasureAxis(
          thickLength: 5,
          gapAxisToLabel: 1,
          labelAnchor: LabelAnchor.centered,
          showLine: true,
          lineStyle: LineStyle(
            color: Colors.blue,
            thickness: 1,
          ),
          labelStyle: LabelStyle(
            color: Colors.blue,
            fontSize: 12,
          ),
        ),
        fillColor: (group, ordinalData, index) {
          if (ordinalData.measure < 5000) {
            return Colors.red;
          }
          return Colors.green;
        },
        groupList: [
          OrdinalGroup(
            color: Colors.blue,
            id: '1',
            data: stepsList.stepsByDay!.map(
              (e) {
                return OrdinalData(
                  domain: e.date.day.toString(),
                  measure: e.steps.toDouble(),
                  color: Colors.green,
                  // color: (e.steps.toDouble() < 5000.00)
                  //     ? Colors.green
                  //     : Colors.black,
                );
              },
            ).toList(),
          ),
        ],
        // outsideBarLabelStyle: (group, ordinalData, index) {
        //   return LabelStyle();
        // },
      ),
    );
    // : const Text('Loading...');
  }
}
