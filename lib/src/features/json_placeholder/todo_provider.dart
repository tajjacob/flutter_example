import 'package:example/src/features/json_placeholder/todo_model.dart';
import 'package:example/src/features/json_placeholder/todo_service.dart';
import 'package:flutter/foundation.dart';

class TodoProvider extends ChangeNotifier {
  final _service = ToDoService();
  bool isLoading = false;
  List<ToDoModel> _todos = [];
  List<ToDoModel> get todos => _todos;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();
    _todos = response;
    isLoading = false;
    notifyListeners();
  }
}
