class StepsByDay {
  final int id;
  final String day;
  final DateTime date;
  final int steps;

  StepsByDay({
    required this.id,
    required this.day,
    required this.date,
    required this.steps,
  });

  factory StepsByDay.fromJson(Map<String, dynamic> json) {
    return StepsByDay(
      id: json['id'],
      day: json['day'],
      date: DateTime.parse(json['date']),
      steps: json['steps'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'day': day,
      'date': date.toIso8601String(),
      'steps': steps,
    };
  }
}
