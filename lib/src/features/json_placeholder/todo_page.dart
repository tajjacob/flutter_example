// https://www.youtube.com/watch?v=Zg1oIUaOS04

import 'package:example/src/features/json_placeholder/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider API'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, provider, child) {
          final todos = provider.todos;

          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(todo.id.toString()),
                  ),
                  title: Text(todo.title),
                );
              });
        },
      ),
    );
  }
}
