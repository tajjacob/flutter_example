import 'package:flutter/material.dart';

import '../../data/models/steps_list_model.dart';
import '../../data/repositories/steps_repo.dart';

enum StepsState {
  initial,
  loading,
  loaded,
  error,
  noInternet,
}

class StepsProvider extends ChangeNotifier {
  bool isConnected = false;
  StepsList? stepsList;
  String? errorMessage;
  StepsState stepsState = StepsState.initial;

  Future<StepsList?> getStepsList() async {
    stepsState = StepsState.loading;
    try {
      stepsList = await StepsRepoInterface().getLocalStepsList();
      stepsState = StepsState.loaded;
    } catch (e) {
      stepsState = StepsState.error;
      errorMessage = e.toString();
    }
    notifyListeners();
    return stepsList;
  }
}
