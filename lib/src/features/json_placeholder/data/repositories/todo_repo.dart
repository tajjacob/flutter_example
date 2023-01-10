import 'dart:convert';

import 'package:example/src/features/json_placeholder/data/models/todo_model.dart';
import 'package:http/http.dart' as http;

// class ToDoService {
//   Future<List<ToDo>> getAll() async {
//     const url = 'https://jsonplaceholder.typicode.com/todos';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body) as List;
//       final todos = json.map((e) {
//         return ToDo(
//           id: e['id'],
//           userId: e['userId'],
//           title: e['title'],
//           completed: e['completed'],
//         );
//       }).toList();
//       return todos;
//     }
//     // else {
//     //   return [];
//     // }
//     throw 'Something went wrong';
//   }
// }

abstract class TodoRepoInterface {
  factory TodoRepoInterface() => TodoRepo();

  Future<List<ToDo>> getAll();
}

class TodoRepo implements TodoRepoInterface {
  @override
  Future<List<ToDo>> getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return ToDo(
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
