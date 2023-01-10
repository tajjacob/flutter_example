import 'package:example/src/features/json_placeholder/data/models/todo_model.dart';
import 'package:example/src/features/json_placeholder/data/repositories/todo_repo.dart';
import 'package:flutter/foundation.dart';

class TodoProvider extends ChangeNotifier {
  final TodoRepoInterface todoRepoInterface = TodoRepoInterface();
  // final _service = ToDoService();
  bool isLoading = false;
  List<ToDo> _todos = [];
  List<ToDo> get todos => _todos;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();

    // final response = await _service.getAll();
    final response = await todoRepoInterface.getAll();
    _todos = response;
    isLoading = false;
    notifyListeners();
  }
}
