import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:health_kit/health_kit.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  HealthPageState createState() => HealthPageState();
}

class HealthPageState extends State<HealthPage> {
  var total = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Health Kit'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OutlinedButton(
                child: const Text("Get Yesterday's Step count"),
                onPressed: () async {
                  getYesterdayStep();
                },
              ),
              Text(total.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> readPermissionsForHealthKit() async {
    try {
      final responses = await HealthKit.hasPermissions([DataType.STEP_COUNT]);

      if (!responses) {
        final value = await HealthKit.requestPermissions([DataType.STEP_COUNT]);

        return value;
      } else {
        return true;
      }
    } on UnsupportedException catch (e) {
      // thrown in case e.dataType is unsupported
      log('$e');
      return false;
    }
  }

  void getYesterdayStep() async {
    var permissionsGiven = await readPermissionsForHealthKit();

    if (permissionsGiven) {
      var current = DateTime.now();

      var dateFrom = DateTime.now().subtract(Duration(
        hours: current.hour + 24,
        minutes: current.minute,
        seconds: current.second,
      ));
      var dateTo = dateFrom.add(const Duration(
        hours: 23,
        minutes: 59,
        seconds: 59,
      ));

      log('dateFrom: $dateFrom');
      log('dateTo: $dateTo');

      try {
        var results = await HealthKit.read(
          DataType.STEP_COUNT,
          dateFrom: dateFrom,
          dateTo: dateTo,
        );
        if (results != null) {
          for (var result in results) {
            total += result.value;
          }
        }
        setState(() {});
        log('results: ${results.toString()}');
        log('value: $total');
      } on Exception catch (ex) {
        log('Exception in getYesterdayStep: $ex');
      }
    }
  }
}
