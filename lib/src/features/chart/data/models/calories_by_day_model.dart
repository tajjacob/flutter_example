class CaloriesByDay {
  final int id;
  final String day;
  final DateTime date;
  final int calories;

  CaloriesByDay({
    required this.id,
    required this.day,
    required this.date,
    required this.calories,
  });

  factory CaloriesByDay.fromJson(Map<String, dynamic> json) {
    return CaloriesByDay(
      id: json['id'],
      day: json['day'],
      date: DateTime.parse(json['date']),
      calories: json['calories'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'day': day,
      'date': date.toIso8601String(),
      'calories': calories,
    };
  }
}
