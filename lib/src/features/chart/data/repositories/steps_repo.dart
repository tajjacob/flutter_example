import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

import '../../../../../generated/assets.dart';
import '../models/steps_list_model.dart';

abstract class StepsRepoInterface {
  factory StepsRepoInterface() => StepsRepo();

  Future<StepsList?> getLocalStepsList();
}

class StepsRepo implements StepsRepoInterface {
  @override
  Future<StepsList?> getLocalStepsList() async {
    StepsList? stepsList;
    try {
      final json = await rootBundle.loadString(Assets.jsonStepsList);
      stepsList = StepsList.fromJson(jsonDecode(json));
      return stepsList;
    } catch (e) {
      log('json error: $e');
    }
    return stepsList;
  }
}
