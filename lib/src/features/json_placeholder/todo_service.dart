import 'dart:convert';

import 'package:example/src/features/json_placeholder/todo_model.dart';
import 'package:http/http.dart' as http;

class ToDoService {
  Future<List<ToDoModel>> getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return ToDoModel(
          id: e['id'],
          userId: e['userId'],
          title: e['title'],
          completed: e['completed'],
        );
      }).toList();
      return todos;
    }
    // else {
    //   return [];
    // }
    throw 'Something went wrong';
  }
}
