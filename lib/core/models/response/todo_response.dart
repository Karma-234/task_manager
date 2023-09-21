import 'package:task_manager/core/models/payload/add_todo.dart';

class TodoResponse {
  final List<AddTodoPayload> todos;

  TodoResponse({required this.todos});
}
