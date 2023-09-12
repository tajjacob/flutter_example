import 'calories_by_day_model.dart';
import 'distance_by_day_model.dart';
import 'steps_by_day_model.dart';

class StepsList {
  final int averageSteps;
  final double averageDistance;
  final int averageCalories;
  final List<StepsByDay>? stepsByDay;
  final List<DistanceByDay>? distanceByDay;
  final List<CaloriesByDay>? caloriesByDay;
  // final double? stepsByMonth;
  // final double? distanceByMonth;
  // final double? caloriesByMonth;

  StepsList({
    required this.averageSteps,
    required this.averageDistance,
    required this.averageCalories,
    required this.stepsByDay,
    required this.distanceByDay,
    required this.caloriesByDay,
    // required this.stepsByMonth,
    // required this.distanceByMonth,
    // required this.caloriesByMonth,
  });

  factory StepsList.fromJson(Map<String, dynamic> json) {
    return StepsList(
      averageSteps: json['averageSteps'],
      averageDistance: json['averageDistance'],
      averageCalories: json['averageCalories'],
      stepsByDay: json['stepsByDay'] != null
          ? (json['stepsByDay'] as List)
              .map((i) => StepsByDay.fromJson(i))
              .toList()
          : null,
      distanceByDay: json['distanceByDay'] != null
          ? (json['distanceByDay'] as List)
              .map((i) => DistanceByDay.fromJson(i))
              .toList()
          : null,
      caloriesByDay: json['caloriesByDay'] != null
          ? (json['caloriesByDay'] as List)
              .map((i) => CaloriesByDay.fromJson(i))
              .toList()
          : null,
      // stepsByMonth: json['stepsByMonth'],
      // distanceByMonth: json['distanceByMonth'],
      // caloriesByMonth: json['caloriesByMonth'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'averageSteps': averageSteps,
      'averageDistance': averageDistance,
      'averageCalories': averageCalories,
      'stepsByDay': stepsByDay != null
          ? stepsByDay!.map((i) => i.toJson()).toList()
          : null,
      'distanceByDay': distanceByDay != null
          ? distanceByDay!.map((i) => i.toJson()).toList()
          : null,
      'caloriesByDay': caloriesByDay != null
          ? caloriesByDay!.map((i) => i.toJson()).toList()
          : null,
      // 'stepsByMonth': stepsByMonth,
      // 'distanceByMonth': distanceByMonth,
      // 'caloriesByMonth': caloriesByMonth,
    };
  }
}
