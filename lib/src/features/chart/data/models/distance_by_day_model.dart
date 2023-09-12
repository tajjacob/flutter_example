class DistanceByDay {
  final int id;
  final String day;
  final DateTime date;
  final double distance;

  DistanceByDay({
    required this.id,
    required this.day,
    required this.date,
    required this.distance,
  });

  factory DistanceByDay.fromJson(Map<String, dynamic> json) {
    return DistanceByDay(
      id: json['id'],
      day: json['day'],
      date: DateTime.parse(json['date']),
      distance: json['distance'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'day': day,
      'date': date.toIso8601String(),
      'distance': distance,
    };
  }
}
