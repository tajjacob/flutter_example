class ToDo {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  const ToDo({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'userId': this.userId,
      'title': this.title,
      'completed': this.completed,
    };
  }

  factory ToDo.fromJson(Map<String, dynamic> map) {
    return ToDo(
      id: map['id'] as int,
      userId: map['userId'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }
}
